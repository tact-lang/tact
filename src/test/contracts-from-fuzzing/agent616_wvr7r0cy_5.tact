struct Inner1 {
    a: Int;
    b: String;
}

struct Inner2 {
    x: Bool?;
    y: Cell;
}

struct TopStruct {
    in1: Inner1;
    in2: Inner2;
    z: Address?;
}

contract ComplexVar {
    sfield: TopStruct;

    init() {
        self.sfield = TopStruct{
            in1: Inner1{a: 1, b: "s"},
            in2: Inner2{x: null, y: emptyCell()},
            z: null
        };
    }
}