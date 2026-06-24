struct Opt1 { a: Int?; }
struct Opt2 { b: Bool?; }
struct Combine {
    first: Opt1;
    second: Opt2;
}

contract OptionalStructs {
    combined: Combine;

    init() {
        self.combined = Combine{
            first: Opt1{ a: null },
            second: Opt2{ b: true }
        };
    }
}