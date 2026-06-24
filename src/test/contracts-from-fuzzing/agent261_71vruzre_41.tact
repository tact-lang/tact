contract NestedOptionalsFlat {
    a: Int?; b: Int?; c: Int?; d: Bool?;
    s: String?; t: Address?; u: Cell?;

    init() {
        self.a = null; self.b = null; self.c = null;
        self.d = null; self.s = null; self.t = null; self.u = null;
    }
    
    receive() {
        let _ = self.a;
    }
}