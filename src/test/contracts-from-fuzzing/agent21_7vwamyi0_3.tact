struct D {
    m: map<Int, Int>;
    n: Int?;
}

contract Test {
    storage: D;
    
    init() {
        self.storage = D{m: emptyMap(), n: null};
    }
}