struct OptionalMix {
    a: Int; 
    b: Bool?; 
    c: String?;
}

contract OptionalAssignments {
    item: OptionalMix;
    
    init() {
        self.item = OptionalMix{a: 5, b: null, c: "abc"};
    }
}