struct NestedWithOptionals {
    a: Int?;
    b: Bool?;
    c: InnerOptional?;
}

struct InnerOptional {
    d: Int;
    e: Bool?;
}

contract NestedOpts {
    no: NestedWithOptionals;

    init() {
        self.no = NestedWithOptionals{
            a:null, b:null, c:null
        };
    }
}
