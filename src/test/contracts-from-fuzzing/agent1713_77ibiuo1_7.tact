struct StructA {
    f1: Int;
    f2: Bool;
}

struct StructB {
    sa: StructA;
    str: String;
}

struct StructC {
    sb: StructB;
    comment: String?;
}

contract ThreeLevelNested {
    data: StructC;

    init() {
        self.data = StructC{
            sb: StructB{
                sa: StructA{
                    f1: 5,
                    f2: true,
                },
                str: "ok",
            },
            comment: null,
        };
    }
}