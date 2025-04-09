struct BigNested {
    inner1: MixedTypes;
    inner2: ManyOptionals;
    inner3: DefaultValStruct;
}

struct MixedTypes {
    i: Int;
    b: Bool;
    s: String;
}

struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
}

struct DefaultValStruct {
    x: Int = 7;
    y: Bool = false;
}

contract ComplexNested {
    full: BigNested;

    init() {
        self.full = BigNested{
            inner1: MixedTypes{ i: 1, b: true, s: "X" },
            inner2: ManyOptionals{ a:null, b:null, c:null, d:null },
            inner3: DefaultValStruct{}
        };
    }
}