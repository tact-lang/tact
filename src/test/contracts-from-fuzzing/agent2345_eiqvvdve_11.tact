struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: SubBig;
}

struct SubBig {
    subA: Int;
    subB: Bool;
    subC: SubSubBig;
}

struct SubSubBig {
    x: Int;
    y: Int;
    z: Bool;
}

contract Combo {
    val: Int = 0;
    big: BigNested;

    init() {
        self.big = BigNested{
            a: 1, b: true, c: "str",
            d: SubBig{
                subA: 2, subB: false,
                subC: SubSubBig{ x:3, y:4, z:true }
            }
        };
    }
}