struct Inner {
    a: Int; 
    b: Bool?;
    c: String;
}

contract OptNestedComplex {
    data: Inner?;

    init() {
        self.data = null;
    }
}