contract OptPrimitiveSemi {
    n: Int? = null;
    
    init() {
        self.n = null;
    }

    receive() {
        let _ = self.n;
    }
}