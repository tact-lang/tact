struct Combo {
    a: Int = 5;
    b: String;
    c: Bool = true;
}

contract PartialDefaults {
    val: Combo;

    init() {
        self.val = Combo{
            b: "hello"
        };
    }
}