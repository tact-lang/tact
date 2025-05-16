struct Sub {
    a: Int;
    b: Bool;
}

struct Outer {
    f1: Int;
    f2: Int?;
    f3: Bool;
    nested: Sub;
}

contract ComplexNested {
    data: Outer = Outer{ f1:1, f2:null, f3:true, nested: Sub{ a: 5, b: false } };
}