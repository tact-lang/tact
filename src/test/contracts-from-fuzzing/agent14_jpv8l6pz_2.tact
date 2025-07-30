struct Defaulted {
  a: Int = 5;
  b: Int;
}

fun test(): Int {
   let d = Defaulted{b: 10};
   return d.a + d.b;
}
