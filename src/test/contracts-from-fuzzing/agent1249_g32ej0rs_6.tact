struct Defaulted {
    foo: Int = 42;
    bar: Bool = true;
    text: String = "default";
    flag: Bool?;
}

contract TestContract {
    s: Defaulted;

    init() {
        self.s = Defaulted{
            foo: 100,
            // omit bar, text (use defaults), set optional to null explicitly
            flag: null,
        };
    }
}