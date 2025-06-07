struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract Test {
    st: Outer = Outer{inner: Inner{x: 10, y: 20}, flag: true};

    // required receive function
    receive() {}

    // Getter returning a nested structure
    get fun getOuter(): Outer {
         return self.st;
    }
}
