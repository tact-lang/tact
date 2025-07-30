struct Param1 { a: Int; }
struct Param2 { b: String; }
struct Param3 { c: Bool; }

contract MultiStructs {
    p1: Param1;
    p2: Param2;
    p3: Param3;

    init() {
        self.p1 = Param1{a: 10};
        self.p2 = Param2{b: "hi"};
        self.p3 = Param3{c: true};
    }
}