struct Defaulted {
    x: Int = 0;
    y: Bool = false;
    z: String = "";
    p: Int?;
}

contract OptionalWithDefaults {
    val: Defaulted;

    init() {
        self.val = Defaulted{
            p: null,
        };
    }
}