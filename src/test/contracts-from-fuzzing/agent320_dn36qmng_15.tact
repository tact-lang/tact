struct HasDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";
    d: Int?; // implicit null
}

contract Test {
    hd: HasDefaults;

    init() {
        self.hd = HasDefaults{
            a: 6, b: true, c: "bye", d: null
        };
    }
}