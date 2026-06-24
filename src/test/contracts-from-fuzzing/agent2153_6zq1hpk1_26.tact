struct DeepA {
    x: Int;
    y: Bool;
}

struct DeepB {
    a: DeepA;
    z: String?;
}

struct DeepC {
    b: DeepB;
    flag: Bool;
}

struct DeepD {
    c: DeepC;
    msg: String;
}

contract FourNestLevels {
    d: DeepD;

    init() {
        self.d = DeepD{
            c: DeepC{
                b: DeepB{
                    a: DeepA{ x: 1, y: false },
                    z: null
                },
                flag: true
            },
            msg: "hello"
        };
    }
}
