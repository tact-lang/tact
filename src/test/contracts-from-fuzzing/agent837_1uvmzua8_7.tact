struct S1 { 
    f1: Int;
}

struct S2 {
    inner1: S1;
    inner2: S1;
    opt: Bool?;
    text: String;
}

contract MultiNested {
    field: S2;
    init() {
        self.field = S2{
            inner1: S1{ f1: 1 },
            inner2: S1{ f1: 2 },
            opt: true,
            text: "hello",
        };
    }
}