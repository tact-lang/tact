struct DefaultPrimitives {
    x: Int = 0;
    y: Bool = false;
    z: String = "";
}

contract ContractDefaultPrimitives {
    inner: DefaultPrimitives;

    init() {
        self.inner = DefaultPrimitives{};
    }
}