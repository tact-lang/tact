contract NestedReturn {
   fun compute(x: Int): Int {
       { if (x > 100) { return x; } }
       return x + 1;
   }
}
