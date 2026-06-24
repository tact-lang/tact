struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    s: String = "";
}

contract ZeroValueDefaults {
    store: ZeroDefaults;
    init() {
        self.store = ZeroDefaults{ a:0, b:false, s:"" };
    }
}