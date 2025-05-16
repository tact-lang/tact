struct S1 { i: Int; s: String; }

struct S2 { b: Bool; s1: S1; o: Int?; }

contract Test {
    a: S1;
    b: S2;

    init() {
        self.a = S1{i:1,s:"x"};
        self.b = S2{b:true,s1:S1{i:2,s:"y"},o:null};
    }
}