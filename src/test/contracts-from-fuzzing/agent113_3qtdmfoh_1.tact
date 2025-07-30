struct Inner {
    b: Bool;
}

struct Outer {
    number: Int;
    flag: Bool?;
    nested: Inner;
}

contract Test {
    state: Outer;

    init() {
        self.state = Outer{
            number: 7,
            flag: null,
            nested: Inner{b: true},
        };
    }

    receive() {
        self.state = Outer{
            number: 13,
            flag: true,
            nested: Inner{b: false},
        };
    }
}
