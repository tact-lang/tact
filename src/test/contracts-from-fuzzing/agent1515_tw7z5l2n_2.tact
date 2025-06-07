struct InnerMost {
    val: Int = 7;
}

struct Inner {
    nest: InnerMost;
    flag: Bool = true;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    text: String = "abc";
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{
                nest: InnerMost{ val: 1 },
                flag: false,
            },
            inner2: Inner{
                nest: InnerMost{ val: 2 },
                flag: true,
            },
            text: "nested",
        };
    }

    receive() {
        dump(self.data.text);
    }
}