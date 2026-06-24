struct TinyNested { v: Int; }
struct MidNested { t1: TinyNested; t2: TinyNested; }
struct BiggerNested { m1: MidNested; m2: MidNested; val: Int; }

contract DoubleNested {
    data: BiggerNested;

    init() {
        self.data = BiggerNested{
            m1: MidNested{ t1: TinyNested{v:1}, t2: TinyNested{v:2} },
            m2: MidNested{ t1: TinyNested{v:3}, t2: TinyNested{v:4} },
            val: 99
        };
    }
}
