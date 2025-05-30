struct Inner {
    innerVal: Int;
}

struct Middle {
    midVal: Bool;
    sub: Inner;
}

struct Wrapper {
    outerVal: String;
    mid: Middle;
}

contract ManyLayeredNested {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            outerVal: "ABC",
            mid: Middle{
                midVal: true,
                sub: Inner{
                    innerVal: 77
                }
            }
        };
    }
}
