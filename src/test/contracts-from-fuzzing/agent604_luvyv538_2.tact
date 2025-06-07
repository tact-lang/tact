struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    nested: Inner;
    label: String;
}

contract LayeredContract {
    complex: Outer;

    init() {
        self.complex = Outer{
            nested: Inner{ x: 42, y: null },
            label: "test"
        };
    }
}