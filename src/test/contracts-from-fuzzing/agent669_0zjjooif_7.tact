struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Int?;
}

contract DefaultsAndOptionals {
    val: Defaults;

    init() {
        self.val = Defaults{ };
    }
}