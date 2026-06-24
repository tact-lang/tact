struct Param1 { x: Int; }
struct Param2 { y: String; }
struct Param3 { z: Bool; }
struct Param4 { a: Int; }

struct CompositeParams {
    p1: Param1;
    p2: Param2;
    p3: Param3;
    p4: Param4;
}

contract NestedParamStructs {
    data: CompositeParams;
    init() {
        self.data = CompositeParams{
            p1: Param1{x:1},
            p2: Param2{y:"y"},
            p3: Param3{z:true},
            p4: Param4{a:2},
        };
    }
}