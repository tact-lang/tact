// test optional tuple struct in param
struct AA {
  val: Int?;
}

struct BB {
  a: Int;
  b: Int;
}

struct CC {
  x: AA;
  y: BB;
}

contract Test(
  foo: CC
) {}