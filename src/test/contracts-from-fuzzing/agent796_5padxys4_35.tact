struct Param1 {
    x: Int; y: Int;
}

struct Param2 {
    a: Param1;
    b: Param1;
}

contract Test {
    combined: Param2;
    init() {
        self.combined = Param2{
            a: Param1{ x:1,y:2 },
            b: Param1{ x:3,y:4 }
        };
    }
}