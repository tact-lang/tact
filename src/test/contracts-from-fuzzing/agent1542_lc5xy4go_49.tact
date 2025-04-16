struct Inner {
   x: Int;
}

struct Outer {
   inner: Inner;
}

contract Weird {
    s: Outer = Outer{ inner: Inner{ x:1 } };
}
