struct InnerS {
    i: Int;
    b: Bool;
}

struct OuterS {
    inn: InnerS;
}

contract AssignMultipleNested {
    d: OuterS;

    init() {
        self.d = OuterS{ inn: InnerS{ i:1, b:true } };
    }

    receive() {
        self.d.inn.i = 42;
        self.d.inn.b = false;
    }
}
