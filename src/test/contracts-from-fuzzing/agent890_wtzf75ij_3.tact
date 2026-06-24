struct OptPrims {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract TestContract {
    data: OptPrims;
    
    init() {
        self.data = OptPrims{ x: null, y: null, s: null };
    }
}