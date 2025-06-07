struct SubA {
    u: Bool;
    v: String;
}

struct SubB {
    x: Int;
    y: String;
}

struct ComplexMulti {
    a: SubA;
    b: SubB;
    flag: Bool;
    count: Int;
}

contract MixedComplexity {
    data: ComplexMulti;

    init() {
        self.data = ComplexMulti{
            a: SubA{u:true, v:"v"},
            b: SubB{x:1, y:"y"},
            flag: false,
            count: 123
        };
    }
}
