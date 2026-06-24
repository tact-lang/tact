struct Child1 { a: Int; opt: Bool? }
struct Child2 { b: String }
struct ParentS {
    c1: Child1;
    c2: Child2;
    flag: Bool;
}

contract MixedNested {
    p: ParentS;
    init() {
        self.p = ParentS{
            c1: Child1{ a: 5, opt: true },
            c2: Child2{ b: "hello" },
            flag: false
        };
    }
}