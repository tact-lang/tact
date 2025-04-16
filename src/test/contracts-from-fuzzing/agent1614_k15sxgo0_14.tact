struct Param1 { f1: Int }
struct Param2 { f2: Int }
struct Param3 { f3: Int }

struct Container2 {
    p1: Param1;
    p2: Param2;
    p3: Param3;
}

contract Test14 {
    container: Container2;

    init() {
        self.container = Container2{
            p1: Param1{f1:1},
            p2: Param2{f2:2},
            p3: Param3{f3:3}
        };
    }
}