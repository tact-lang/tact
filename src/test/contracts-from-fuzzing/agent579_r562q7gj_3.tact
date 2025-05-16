struct Inner {
    val: Int;
    maybeVal: Bool?;
}

struct Outer {
    data: Inner;
    note: String?;
}

contract TestContract {
    complex: Outer;

    init() {
        self.complex = Outer{
            data: Inner{ val: 7, maybeVal: null },
            note: "hello"
        };
    }
}