struct Inner {
    ix: Int = 10;
    flag: Bool = true;
    s: String = "hi";
}

struct Outer {
    value: Int = 99;
    opt: Int?;
    nested: Inner;
}

contract Fuzz {
    state: Outer;

    init() {
        self.state = Outer{
            value: 123,
            opt: null,
            nested: Inner{
                ix: 7,
                flag: false,
                s: "x"
            }
        };
    }
}