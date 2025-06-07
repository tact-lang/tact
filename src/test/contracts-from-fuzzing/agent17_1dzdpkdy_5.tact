struct X { x1: Int; }

struct Y { y1: Bool; }

struct BigOptionalStruct {
    optX: X?;
    optY: Y?;
    flag: Bool?;
    counter: Int?;
}

contract TestContract {
    big: BigOptionalStruct;

    init() {
        self.big = BigOptionalStruct{
            optX: null,
            optY: null,
            flag: null,
            counter: null,
        };
    }
}