struct Struc {
    a: Int;
    b: Bool; 
    c: Int as uint8;
    d: Int as uint256;
}

contract SerializationWidths {
    f: Struc;

    init() {
        self.f = Struc{ a:1, b:true, c:255, d:100000 };
    }
}