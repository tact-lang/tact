struct MultiNested {
    a: A;
    b: B;
    c: C;
}

struct A { x: Int; y: Bool; }
struct B { s: String; flag: Bool?; }
struct C { d: D; val: Int; }
struct D { name: String; }

contract TestContract {
    m: MultiNested;

    init() {
        self.m = MultiNested{
            a: A{ x:1, y:true },
            b: B{ s:"hi", flag:null },
            c: C{ d: D{ name:"deep" }, val:42 }
        };
    }
}
