struct Inner {
    flag: Bool?;
}

struct Outer {
    num: Int;
    nest: Inner;
}

contract DeepNestedOptional {
    state: Outer;

    init() {
        self.state = Outer{
            num: 123,
            nest: Inner{ flag: false }
        };
    }
}