struct DeepNested {
    foo: Int;
    bar: Bool;
}

struct Middle {
    deep: DeepNested;
    txt: String;
}

struct Outer {
    mid: Middle;
    zz: Int;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                deep: DeepNested{
                    foo: 7,
                    bar: false,
                },
                txt: "abc"
            },
            zz: 99
        };
    }
}