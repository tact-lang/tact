struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;
}

contract TestContract {
    mopts: ManyOpts;
    
    init() {
        self.mopts = ManyOpts{};
    }
}