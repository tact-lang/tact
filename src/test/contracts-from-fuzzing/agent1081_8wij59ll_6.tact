struct Deeper {
    inner: Int;
    
    opt: Int?;
}

contract OptionalFieldInit {
    deep: Deeper;
    
    init() {
        self.deep = Deeper { inner: 10, opt: null };
    }
}