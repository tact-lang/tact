contract OptionalSkipInit {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    
    init() {}
    
    receive() {
        // do nothing, just to force inclusion
    }
}