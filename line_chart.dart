import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartFixed extends StatelessWidget {
  const LineChartFixed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Mengatur sudut rounded
            ),
            // elevation: 3, // Menambahkan shadow
            margin: const EdgeInsets.symmetric(horizontal: 10.0), // Margin sekitar Card
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 25, top: 20, bottom: 12), // Padding di dalam Card
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      show: true,
                      spots: const [
                        FlSpot(0, 45),
                        FlSpot(1, 44),
                        FlSpot(2, 40),
                        FlSpot(3, 38),
                        FlSpot(4, 34),
                        FlSpot(5, 30),
                      ],
                      barWidth: 5,
                      color: Colors.green,
                      isCurved: true,
                      aboveBarData: BarAreaData(show: true, color: Colors.green[50]),
                      belowBarData: BarAreaData(show: true, color: Colors.limeAccent[400]),
                      dotData: FlDotData(show: false),
                    ),
                  ],
                  maxY: 50,
                  minY: 30,
                  minX: 0,
                  maxX: 5,
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          if (value == 0) return const Text(''); // Menghilangkan angka 0 pada origin
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '${(value.toInt() * 10).toString().padLeft(2, '0')}:00',
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                  ),
                  lineTouchData: LineTouchData(enabled: true,),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: false,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
