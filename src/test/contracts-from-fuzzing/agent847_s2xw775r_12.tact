struct Compose {
    inner1: InnerStruct;
    inner2: InnerStruct2;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
}

struct InnerStruct2 {
    name: String;
    ok: Bool;
}

contract CompositeNested {
    nested: Compose;

    init() {
        self.nested = Compose{
            inner1: InnerStruct{value: 4, flag: true},
            inner2: InnerStruct2{name: "hi", ok: false}
        };
    }
}