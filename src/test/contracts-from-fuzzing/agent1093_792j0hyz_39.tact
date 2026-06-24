struct Wrapped {
    inner: Int? = null;
}

contract WrappedDefaults {
    w: Wrapped;
    
    init() {
        self.w = Wrapped{};
    }
}