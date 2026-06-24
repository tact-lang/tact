struct ComplexA { a:Int; }
struct ComplexB { b:Bool; }
struct ComplexC { c:String; }

struct Container {
    a:ComplexA;
    b:ComplexB;
    c:ComplexC;
}

contract MixedStructs {
    data: Container;

    init() {
        self.data = Container{
            a: ComplexA{ a:1 },
            b: ComplexB{ b:true },
            c: ComplexC{ c:"ok" }
        };
    }
}
