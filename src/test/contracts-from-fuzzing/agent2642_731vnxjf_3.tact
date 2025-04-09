struct Defaults {
    a: Int = 5;
    b: Bool?;
    c: String = "foo";
}

contract Store {
    val: Defaults;
    init() {
        self.val = Defaults{ };
    }
}