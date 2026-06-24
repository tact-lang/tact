struct OneField {
    a: Int;
}

struct TwoFields {
    f: OneField;
    b: Bool;
}

struct ThreeFields {
    g: TwoFields;
    s: String;
}

struct FourFields {
    h: ThreeFields;
    flag: Bool?;
}

contract NestDeeper {
    all: FourFields;

    init() {
        self.all = FourFields{
            h: ThreeFields{
                g: TwoFields{
                    f: OneField{ a: 1 },
                    b: true
                },
                s: "test"
            },
            flag: null
        };
    }
}