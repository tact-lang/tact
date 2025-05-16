contract FFlowTest {
   fun controlFlow(a: Bool): Int {
      try {
         if (a) { throw(7); } else { return 15; }
      } catch (e) {
         if (a) { return e * 2; } else { return e + 3; }
      }
   }
}
