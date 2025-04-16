struct Inner {
    n: Int;
}

struct Outer {
    nested: Inner?;
    txt: String;
}

contract TestContract {
    info: Outer;

    init() {
        self.info = Outer{
            nested: null,
            txt: "abc",
        };
    }
}
