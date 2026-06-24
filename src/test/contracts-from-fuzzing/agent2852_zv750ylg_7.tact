struct Flat {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

struct Nested {
    f1: Flat;
    f2: Flat;
    f3: Flat;
    f4: Flat;
}

contract ManyNestedFlat {
    s: Nested;

    init() {
        self.s = Nested{
            f1: Flat{a:1,b:true,c:"1",d:myAddress()},
            f2: Flat{a:2,b:false,c:"2",d:myAddress()},
            f3: Flat{a:3,b:true,c:"3",d:myAddress()},
            f4: Flat{a:4,b:false,c:"4",d:myAddress()}
        };
    }
}