struct A { 
    x: Int;
    y: Bool;
}

struct B {
    s: String;
    nested: A;
}

contract ComboFields {
    foo: A;
    bar: B;

    init() {
        self.foo = A{ x:5, y:false };
        self.bar = B{ s:"str", nested: A{ x:9, y:true } };
    }
}