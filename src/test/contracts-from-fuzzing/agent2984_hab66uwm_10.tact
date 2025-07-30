struct InlineDefaults {
    x: Int = 2;
    y: Int?; 
    z: Bool = true;
}

contract Test11 {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{ y:null };
    }
}
