struct Simple {
    val: Int;
}

struct OptionalSimple {
    opt: Simple?;
}

contract OptionalStructTest {
    data: OptionalSimple;

    init() {
        self.data = OptionalSimple{ opt: null };
    }
}