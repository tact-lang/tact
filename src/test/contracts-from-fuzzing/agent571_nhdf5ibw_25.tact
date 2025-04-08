struct SmallStruct { z: Int as uint1; }

struct Mix {
    a: Int as int1;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: SmallStruct?;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: null
        };
    }
}