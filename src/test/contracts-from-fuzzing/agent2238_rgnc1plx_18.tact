struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: NestedStruct;
}

struct NestedStruct {
    na: Int;
    nb: Bool;
    nc: String;
}

contract TestContract {
    big: BigNested;

    init() {
        self.big = BigNested{
            a: 1,
            b: true,
            c: "hi",
            d: NestedStruct{
                na: 2,
                nb: false,
                nc: "ok"
            }
        };
    }
}
