struct OptionalEmpty {
    val: Int?;
}

contract OptionalInit {
    foo: OptionalEmpty?;
    
    init() {
        self.foo = null;
    }
}