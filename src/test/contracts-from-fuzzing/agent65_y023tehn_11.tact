struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
}

contract Test {
    val: Defaults;
    
    init() {
        self.val = Defaults{};
    }
}