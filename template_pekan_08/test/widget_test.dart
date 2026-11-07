import 'package:flutter_test/flutter_test.dart';
import 'package:template_pekan_08/main.dart';

void main() {
  testWidgets('Smoke test template pekan 08', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Kesehatan Siaga Kota Bandung'), findsOneWidget);
  });
}
