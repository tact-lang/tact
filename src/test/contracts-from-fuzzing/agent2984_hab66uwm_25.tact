struct Param1 { a: Int }
struct Param2 { b: Bool }

contract Test26 {
    p1: Param1;
    p2: Param2;
    x: Int;
    y: Bool;

    init() {
        self.p1 = Param1{a:42};
        self.p2 = Param2{b:true};
        self.x = 13;
        self.y = false;
    }
}
