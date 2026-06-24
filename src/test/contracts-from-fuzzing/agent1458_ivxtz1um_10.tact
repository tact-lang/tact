struct TripleNested {
    a: Int;
    b: String;
    c: Bool;
}

struct MidWithTriple {
    first: TripleNested;
    second: TripleNested;
}

contract ContractWithManyNestedRepeats {
    nested1: MidWithTriple;
    nested2: MidWithTriple;

    init() {
        self.nested1 = MidWithTriple{
            first: TripleNested{ a:1, b:"A", c:true },
            second: TripleNested{ a:2, b:"B", c:false }
        };
        self.nested2 = MidWithTriple{
            first: TripleNested{ a:3, b:"C", c:true },
            second: TripleNested{ a:4, b:"D", c:false }
        };
    }
}