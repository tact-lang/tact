struct Inner {
    x: Int;
}

struct Outer {
    a: Int;
    inner: Inner;
}

contract Test6 {
    value: Outer;

    init() {
         self.value = Outer { a: 10, inner: Inner { x: 20 } };
    }

    receive() {}

    // Getter returning a deeply nested structure
    get fun getOuter(): Outer {
         return self.value;
    }
}
