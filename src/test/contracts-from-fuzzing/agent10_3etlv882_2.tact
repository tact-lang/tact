contract ReturnTest2 {
   fun regular(): Int {
      if (true) { return 1; }
      return 2;
   }
   receive () {}
}