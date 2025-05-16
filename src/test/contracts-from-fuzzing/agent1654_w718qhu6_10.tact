struct Wrap1 {
    val: Int?;
}

struct Wrap2 {
    inner: Wrap1?;
}

contract OptionalNest {
    field: Wrap2?;

    init() {
        self.field = Wrap2{ inner: null };
    }
}