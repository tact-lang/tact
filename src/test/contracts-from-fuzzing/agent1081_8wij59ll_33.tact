struct Em {
    // Empty structs are disallowed per the known issues.
    x: Int;
}

contract StrWrap {
    inner: Em;
    
    init() {
        self.inner = Em{x:42};
    }
}