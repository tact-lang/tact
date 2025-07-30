struct WrapInt { val: Int }

contract NestedOptionals {
    field: WrapInt?;

    init() {
        self.field = null;
    }
}
