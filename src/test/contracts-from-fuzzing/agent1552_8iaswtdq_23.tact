struct Nested {
    a: Int;
    b: String;
    c: Bool;
}

contract ManyNested {
    f1: Nested;
    f2: Nested;
    f3: Nested;

    init() {
        self.f1 = Nested{a:1,b:"b1",c:true};
        self.f2 = Nested{a:2,b:"b2",c:false};
        self.f3 = Nested{a:3,b:"b3",c:true};
    }
}