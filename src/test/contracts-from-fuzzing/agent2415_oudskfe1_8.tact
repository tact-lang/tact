struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptNestContract {
    nested: OptionalNested?;

    init() {
        self.nested = OptionalNested{
            a:null,
            b:true,
            c:"x"
        };
    }
}