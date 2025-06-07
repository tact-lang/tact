struct Rec {
    inner: Int;
}

contract OptionalFieldContract {
    maybe: Rec?;

    init() {
        self.maybe = Rec{ inner: 123 };
    }
}