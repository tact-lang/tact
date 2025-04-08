struct DeepInner {
    val: String?;
}

struct Middle {
    val: DeepInner?;
}

struct Outer {
    m: Middle;
}

contract TestDeepOptional {
    field: Outer;

    init() {
        self.field = Outer{
            m: Middle{
                val: DeepInner{
                    val: "hi",
                },
            },
        };
    }
}
