struct InnerMost {
    b: Bool;
    c: String;
}

struct Middle {
    x: Int?;
    inn: InnerMost;
}

struct Outer {
    val: Middle;
    str: String;
}

contract DeepOptionalNested {
    state: Outer;

    init() {
        self.state = Outer{
            val: Middle{
                x: null,
                inn: InnerMost{
                    b: false,
                    c: "hello"
                }
            },
            str: "test"
        };
    }
}