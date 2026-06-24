struct SomeVals {
    a: Int?;
    b: String?;
}

contract OptionalsNonNullAssigned {
    state: SomeVals;

    init() {
        self.state = SomeVals{
            a: 42,
            b: "hi"
        };
    }
}