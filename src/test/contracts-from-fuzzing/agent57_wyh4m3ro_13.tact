contract TestNestedBranch {
   fun test(flag: Bool): Int {
      if (flag) {
         if (true) {
            return 10;
         } else {
            0;
         }
      } else {
         return 20;
      }
      return 30;
   }
   receive() {}
}
