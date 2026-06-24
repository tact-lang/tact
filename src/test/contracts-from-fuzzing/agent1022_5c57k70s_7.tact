struct Inner {
    val1: Int?;
    val2: String?;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
    flag: Bool;
}

struct Outer {
    middle1: Middle;
    middle2: Middle;
    description: String;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            middle1: Middle{
                inner1: Inner{ val1: null, val2: null },
                inner2: Inner{ val1: 42, val2: "hi" },
                flag: true
            },
            middle2: Middle{
                inner1: Inner{ val1: -1, val2: null },
                inner2: Inner{ val1: null, val2: "bye" },
                flag: false
            },
            description: "Deep nested"
        };
    }

    receive() {}
}