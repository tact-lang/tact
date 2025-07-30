struct Inner {
    val: Int;
    note: String;
}

struct Middle {
    a: Int;
    nested: Inner;
}

struct Outer {
    b: Bool;
    core: Middle;
} 

contract DeepNestedContract {
    f: Outer;

    init() {
        self.f = Outer{
            b: true,
            core: Middle{
                a: 5,
                nested: Inner{
                    val: 42,
                    note: "hi",
                },
            },
        };
    }
}