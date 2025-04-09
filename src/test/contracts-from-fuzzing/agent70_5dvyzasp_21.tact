struct Defaults {
    a: Int = 2;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
}

contract C {
    x: Defaults;

    init() {
        self.x = Defaults{ d: null };
    }
}