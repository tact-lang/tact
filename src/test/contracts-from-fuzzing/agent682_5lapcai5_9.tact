struct BigNested {
    n1: Nested1;
    n2: Nested2;
}

struct Nested1 {
    a: Int; b: Int; c: String;
}

struct Nested2 {
    d: Bool; e: Int?; f: String?;
}

contract TestContract {
    nested: BigNested;

    init() {
        self.nested = BigNested{
            n1: Nested1{a:1, b:2, c:"hi"},
            n2: Nested2{d:true, e:null, f:"yo"}
        };
    }
}