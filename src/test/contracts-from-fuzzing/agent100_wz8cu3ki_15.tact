struct OptNested1 {
    val: Int?;
}

struct OptNested2 {
    val: OptNested1?;
}

contract Test16 {
    maybe: OptNested2;

    init() {
        self.maybe = OptNested2{ val: null };
    }
}