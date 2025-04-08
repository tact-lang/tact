struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
    d: Int?; // defaults to null
}

contract Test9 {
    val: Defaults;

    init() {
        self.val = Defaults{
            // omit all, rely on defaults
            
        };
    }
}