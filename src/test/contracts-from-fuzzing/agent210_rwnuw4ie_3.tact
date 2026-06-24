struct InnerDeep {
    foo: Int;
    bar: Bool?;
}

struct Middle {
    nested1: InnerDeep;
    nested2: InnerDeep;
}

struct Outer {
    m: Middle;
    anotherInt: Int;
}

contract TestStorage {
    composed: Outer;
    init() {
        self.composed = Outer{
            m: Middle{
                nested1: InnerDeep{ foo: 7, bar: true },
                nested2: InnerDeep{ foo: 9, bar: null }
            },
            anotherInt: 3
        };
    }
}
