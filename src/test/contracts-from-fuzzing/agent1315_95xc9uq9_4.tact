struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost;
    flag: Bool;
}

struct Outer {
    innerStruct: Inner;
    text: String;
}

contract ComplexNested {
    store: Outer;

    init() {
        self.store = Outer{
            innerStruct: Inner{
                nested: InnerMost{ val: 100 },
                flag: true
            },
            text: "abc"
        };
    }
}