contract TestIfExpression {
    receive() {
         // Test a complex arithmetic expression in the condition
         if ((1 + 2 * 3) == 7) {
              // Expected to take the 'true' branch
              dump("Yes".asComment());
         } else {
              dump("No".asComment());
         }
    }
}
