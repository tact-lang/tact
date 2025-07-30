struct OptInStruct {
    a: Int;
    b: Bool?;
    c: Int?;
}

struct TopStruct {
    x: OptInStruct?;
    y: Bool;
}

contract Test {
    stuff: TopStruct;
    init() {
        self.stuff = TopStruct{
            x: OptInStruct{a: 1,b: null,c:2},
            y: false
        };
    }
}