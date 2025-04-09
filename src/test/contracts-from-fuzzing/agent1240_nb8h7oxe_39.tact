struct Mid {
    inner: Int;
}
contract StructInsideContract {
    d: Mid;
    init() {
        self.d = Mid{ inner: 555 };
    }
}