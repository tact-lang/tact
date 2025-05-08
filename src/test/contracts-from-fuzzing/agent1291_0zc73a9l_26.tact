struct BigNested {
    a: Int;
    b: StructB;
}

struct StructB {
    c: Int;
    d: StructC;
}

struct StructC {
    e: Int;
    f: String;
}

contract Test {
    big: BigNested;

    init() {
        self.big = BigNested{
            a:1,
            b: StructB{
                c:2,
                d: StructC{
                    e:3,
                    f:"hi"
                }
            }
        };
    }
}