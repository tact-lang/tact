struct Inner {
    flag: Bool;
    text: String;
}

struct Outer {
    in1: Inner;
    in2: Inner;
}

contract MultiStruct {
    state: Outer;

    init() {
        self.state = Outer {
            in1: Inner { flag: true, text: "a" },
            in2: Inner { flag: false, text: "b" }
        };
    }
}