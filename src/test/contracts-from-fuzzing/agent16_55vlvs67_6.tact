contract Test4_Corrected {
   fun nestedBlockReturn(a: Int): Int {
      {
         if(a > 0) { return a + 10; }
      }
      return a;
   }
}
