contract DefaultOpts {
    i: Int? = null;
    b: Bool = false;
    s: String? = null;
    
    init() {
        self.i = 10;
        self.b = true;
        self.s = "set";
    }
}