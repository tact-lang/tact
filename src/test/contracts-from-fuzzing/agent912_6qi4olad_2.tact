struct Inner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptNestedTest {
    innerField: Inner;
    
    init() {
        self.innerField = Inner{};
    }
}