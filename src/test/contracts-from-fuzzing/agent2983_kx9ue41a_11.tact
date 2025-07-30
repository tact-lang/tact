struct StructA {
    val: Int;
}

struct StructB {
    a: StructA;
    flag: Bool;
}

struct StructC {
    b: StructB;
    msg: String;
}

contract MultiNestedStructs {
    field: StructC;

    init() {
        self.field = StructC{
            b: StructB{
                a: StructA{ val: 10 },
                flag: true
            },
            msg: "text"
        };
    }
}