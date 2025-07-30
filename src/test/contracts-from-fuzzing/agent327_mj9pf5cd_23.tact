struct NestedOptInt {
    val: Int? = null;
}

contract PersistNestedOptInt {
    inner: NestedOptInt;

    init() {
        self.inner = NestedOptInt{};
    }
}
