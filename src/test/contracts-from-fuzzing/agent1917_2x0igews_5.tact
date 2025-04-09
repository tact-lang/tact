struct ComplexOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ComplexStructOpt {
    state: ComplexOptionals;

    init() {
        self.state = ComplexOptionals{
            a: null,
            b: null,
            c: null,
        };
    }
}
