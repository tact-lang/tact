struct Deep {
    s: String;
    opt: Int?;
}

struct Middle {
    deep: Deep;
    optBool: Bool?;
}

contract DeepMiddle {
    rec: Middle;

    init() {
        self.rec = Middle{
            deep: Deep{
                s: "hello",
                opt: null
            },
            optBool: null
        };
    }

    receive() {}
}