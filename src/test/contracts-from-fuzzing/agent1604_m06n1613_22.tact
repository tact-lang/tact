struct HasDefaultsOpt {
    a: Int?;
    b: Bool = true;
}

contract StructDefaultOpt {
    s: HasDefaultsOpt;
    init() {
        self.s = HasDefaultsOpt{ a: null }; 
    }
    receive() {}
}