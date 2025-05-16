struct Mix {
    a: Int = 1;
    b: Bool?;
    c: String = "foo";
    d: Address?;
}

contract TestContract {
    optMix: Mix?;

    init() {
        self.optMix = Mix{ a: 5, b: null, c: "bar", d: null };
    }
}
