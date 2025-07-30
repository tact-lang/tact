struct DeepAndWideNested {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    d: Bool;
    e: InnerLeaf;
}

struct Inner2 {
    f: String;
    g: InnerLeaf;
}

struct InnerLeaf {
    val: Int?;
    flag: Bool;
}

contract DeepWideTest {
    s: DeepAndWideNested;

    init() {
        self.s = DeepAndWideNested{
            a: 1,
            b: Inner1{
                d: true,
                e: InnerLeaf { val: null, flag: false }
            },
            c: Inner2 {
                f: "abc",
                g: InnerLeaf { val: 42, flag: true }
            }
        };
    }
}