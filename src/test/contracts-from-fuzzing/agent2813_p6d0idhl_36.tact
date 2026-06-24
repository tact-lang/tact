struct OptionalSimple {
    val: Int?;
}

contract OptionalSimpleTest {
    store: OptionalSimple;
    init() {
        self.store = OptionalSimple{ val: null };
    }
}
