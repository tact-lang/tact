struct O1 { v: Int?; }
struct O2 { w: Bool?; }
struct O3 { x: String?; }

contract Test37 {
    a: O1;
    b: O2;
    c: O3;
    init() {
        self.a = O1{v:null};
        self.b = O2{w:null};
        self.c = O3{x:null};
    }
}