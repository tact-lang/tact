struct OptOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    allnull: OptOpts;
    
    init() {
        self.allnull = OptOpts{};
    }
}