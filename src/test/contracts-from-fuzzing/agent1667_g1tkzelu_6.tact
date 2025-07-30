struct Tiny {
    f1: Bool;
}

struct Medium {
    t1: Tiny;
    f2: Int?
}

struct Big {
    m: Medium;
    text: String;
    optInt: Int?;
    flag: Bool;
}

contract DeepMixed {
    data: Big;

    init() {
        self.data = Big{
            m: Medium{ t1: Tiny{ f1:false }, f2:null },
            text: "hi",
            optInt: null,
            flag: true
        };
    }
}
