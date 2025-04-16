struct Wrapper {
    val: Int;
}

contract WrapperTest {
    field: Wrapper;

    init() {
        self.field = Wrapper{val:123};
    }
}
