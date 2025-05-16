struct DeepNested {
    l: String;
    m: Bool;
}

struct Middle {
    j: Int;
    k: DeepNested;
}

struct Outer {
    f: Bool;
    g: Middle;
    h: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            f: true,
            g: Middle{
                j: 12,
                k: DeepNested{
                    l: "str",
                    m: true
                }
            },
            h: null
        };
    }
}