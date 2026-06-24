struct Nested {
    n: Int;
    b: Bool?;
    s: String;
}

struct Wrapper {
    val1: Int;
    optNested: Nested?;
}

contract DeepOptionals {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            val1: 42,
            optNested: Nested{
                n: 1,
                b: true,
                s: "hi"
            }
        };
    }
}
