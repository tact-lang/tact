// Multiple composite persistent fields of nested structs
struct S1 {
    a: Int;
    b: String?;
}

struct S2 {
    x: Bool;
    y: Int?;
}

contract MultiStruct {
    one: S1;
    two: S2;

    init() {
        self.one = S1{a:12,b:null};
        self.two = S2{x:true,y:null};
    }
}