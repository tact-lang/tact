struct InnerMost {
    msg: String;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract NestStructs {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{ msg: "hello" }
            }
        };
    }
}