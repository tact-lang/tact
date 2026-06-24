struct InnerMost {
    flag: Bool;
    text: String;
}

struct Nested1 {
    im: InnerMost;
    val: Int;
}

struct Nested2 {
    n1: Nested1;
    anotherFlag: Bool;
}

contract SuperDeep {
    nested: Nested2;
    init() {
        self.nested = Nested2{
            n1: Nested1{
                im: InnerMost{
                    flag: true,
                    text: "hi"
                },
                val: 42
            },
            anotherFlag: false
        };
    }
}