struct Defaulted {
    a: Int = 7;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
}

contract DefaultsInStructs {
    val: Defaulted;

    init() {
        self.val = Defaulted{
            d: null
        };
    }
}
