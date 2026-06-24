struct Inner {
 x: Int;
}

struct Outer {
 a: Int;
 b: Inner;
}

contract NestedIntStruct {
 s: Outer = Outer{a: 5, b: Inner{x:6}};
}