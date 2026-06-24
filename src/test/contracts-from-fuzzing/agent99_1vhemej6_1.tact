fun earlyReturn(a: Int): Int {
   if(a > 0) {
      return a;
   }
   return -a;
}

fun main() {
   let x = earlyReturn(5);
   dump(x);
}
