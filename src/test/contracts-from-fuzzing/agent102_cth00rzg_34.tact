contract ContractWithConstants {
    const X: Int = 5;
    const Y: Bool = false;
    const Z: String = "hello";
    
    a: Int = 1;
    b: Bool = true;

    init() {
        self.a = self.X;
        self.b = self.Y;
    }
}