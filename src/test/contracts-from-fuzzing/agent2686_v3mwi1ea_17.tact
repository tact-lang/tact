struct StructA {
    a: Int?;
}

struct StructB {
    sa: StructA;
    txt: String?;
}

struct StructC {
    sb: StructB;
    active: Bool?;
}

contract ChainOptional {
    val: StructC;

    init() {
        self.val = StructC{
            sb: StructB{
                sa: StructA{ a: null },
                txt: "hi"
            },
            active: true
        };
    }
}
