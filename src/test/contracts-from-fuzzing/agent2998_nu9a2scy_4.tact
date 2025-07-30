struct Defaults {
    a: Int = 7;
    b: Bool = false;
    c: String = "hi";
    d: Int?; // default null
    e: Bool?;
}

contract DefaultsContract {
    val: Defaults;
    
    init() {
        self.val = Defaults{};
    }
}