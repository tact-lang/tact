struct Inner1 { x: Int; y: String; }
struct Inner2 { a: Bool; b: String?; }

struct Outer {
    f1: Inner1;
    f2: Inner2;
}

contract StructsInFields {
    s: Outer;

    init() {
        self.s = Outer{
            f1: Inner1{x:5,y:"val"},
            f2: Inner2{a:true,b:null},
        };
    }
}
