contract TestDivision {
    receive() {
         // Division operator: integer division which truncates toward zero when positive and away from zero when negative
         // Expect: 7 / 2 -> 3, and (-7) / 2 -> -4.
         dump(7 / 2);
         dump((-7) / 2);
    }
}
