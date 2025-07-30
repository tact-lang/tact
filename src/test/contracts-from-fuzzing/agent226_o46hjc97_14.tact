struct OptionalLayer2 {
    a: Int?;
    b: String?;
}

struct OptionalLayer1 {
    nested: OptionalLayer2?;
    flag: Bool?;
}

contract TestNestedOptionals {
    n: OptionalLayer1;

    init() {
        self.n = OptionalLayer1 {
            nested: OptionalLayer2 { a:null, b:null },
            flag: true
        };
    }
}
