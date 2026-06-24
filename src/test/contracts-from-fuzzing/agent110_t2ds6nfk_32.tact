struct EmptyOpt {
    foo: Int?;
    bar: Bool?;
}

contract MissingBoth {
    v: EmptyOpt;
    init() {
        self.v = EmptyOpt{}; // omit both optionals
    }
}