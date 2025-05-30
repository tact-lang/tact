contract TestNested {
    fun test(): Int {
         if (1 < 2) {
             {
                 if (2 < 3) { return 5; }
                 else { return 7; }
             }
         } else {
             return 11;
         }
    }
}
