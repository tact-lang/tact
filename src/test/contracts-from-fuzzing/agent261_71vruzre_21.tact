contract OptionalPrimitive {
    n: Int?;
    b: Bool?;
    s: String?;

    init() {
        self.n = null;
        self.b = true;
        self.s = null;
    }
    
    receive() {
        if (self.b != null && self.b!!) {
            let _ = self.n;
        }
    }
}