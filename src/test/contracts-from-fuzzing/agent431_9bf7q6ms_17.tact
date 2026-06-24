struct C1 { a: Int; }
struct C2 { b: Bool; }
struct C3 { c: String; }
struct C4 { d: Int?; }
struct C5 { e: Bool?; }
struct C6 { f: String?; }

contract MixedLayered {
    x1: C1;
    x2: C2;
    x3: C3;
    x4: C4;
    x5: C5;
    x6: C6;

    init() {
        self.x1 = C1{a:11};
        self.x2 = C2{b:true};
        self.x3 = C3{c:"text"};
        self.x4 = C4{d:null};
        self.x5 = C5{e:null};
        self.x6 = C6{f:null};
    }
}
