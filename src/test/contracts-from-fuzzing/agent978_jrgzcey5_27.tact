// contract with persistent field optional tuple of int and bool via struct
struct Tuple {
    i: Int;
    b: Bool;
}

contract OptionalTupleTest {
    value: Tuple?;

    init() {
        self.value = null;
    }
}