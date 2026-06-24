struct Defaults {
    a: Int = 1;
    b: String = "b";
    c: Bool = false;
    d: Int?;
}

contract DefaultInit {
    x: Defaults;
    init() {
        self.x = Defaults{ };
    }
}