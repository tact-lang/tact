struct Inner {
    a: Int;
    b: String?;
    c: Bool;
}

struct Outer {
    arr1: Inner;
    arr2: Inner;
    arr3: Inner;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            arr1: Inner{ a: 1, b: null, c: true },
            arr2: Inner{ a: 2, b: "test", c: false },
            arr3: Inner{ a: 3, b: null, c: true }
        };
    }
}