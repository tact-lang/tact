contract Test5 {
   fun test(): Int {
      { { if (true) { return 1; } } }
      return 0;
   }
}
