import 'package:flutter_test/flutter_test.dart';

import 'package:health_app/main.dart';

void main() {
  testWidgets('Test Order Medication Button', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the Order Medication button is present.
    expect(find.text('Order Medication'), findsOneWidget);

    // Tap the 'Order Medication' button and trigger a frame.
    await tester.tap(find.text('Order Medication'));
    await tester.pump();

    // Verify that the Medication Page is displayed.
    expect(find.text('Medication browsing and ordering functionality goes here.'), findsOneWidget);
  });

  testWidgets('Test View Statement Button', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the View Statement button is present.
    expect(find.text('View Statement'), findsOneWidget);

    // Tap the 'View Statement' button and trigger a frame.
    await tester.tap(find.text('View Statement'));
    await tester.pump();

    // Verify that the Statement Page is displayed.
    expect(find.text('Statement viewing functionality goes here.'), findsOneWidget);
  });
}
