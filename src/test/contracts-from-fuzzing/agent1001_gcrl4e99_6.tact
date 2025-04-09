struct A {
    i: Int;
    s: String;
    b: Bool?;
}

struct B {
    nestedA: A;
    b2: Bool;
}

struct C {
    nestedB: B;
    optA: A?;
    anotherStr: String;
}

contract OptionalDeep {
    deep: C;
    
    init() {
        self.deep = C{
            nestedB: B{
                nestedA: A{ i:1, s:"a", b:true },
                b2: false
            },
            optA: null,
            anotherStr: "x"
        };
    }
}