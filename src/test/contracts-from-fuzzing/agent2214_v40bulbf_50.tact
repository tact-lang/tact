struct A {x:Int;}
struct B {y:Int;}
struct C {z:Int;}

struct ComplexNested {
    f1: A?;
    f2: B?;
    f3: C?;
}

contract OptComplex {
    val: ComplexNested;

    init() {
        self.val = ComplexNested{f1:null, f2:null, f3:null};
    }
}