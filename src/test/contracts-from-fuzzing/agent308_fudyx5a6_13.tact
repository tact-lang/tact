struct DefaultsAndNon {
    a: Int = 5;
    b: String;
    c: Bool = true;
}

contract MixedDefaults {
    val: DefaultsAndNon;

    init() {
        self.val = DefaultsAndNon{
            b: "hello"
        };
    }
}
