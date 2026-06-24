struct Defaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;  // implicit null
}

contract Defaulted {
    s: Defaults;

    init() {
        self.s = Defaults{
            a: 42,
            b: true,
            c: "hi",
            d: null
        };
    }
}