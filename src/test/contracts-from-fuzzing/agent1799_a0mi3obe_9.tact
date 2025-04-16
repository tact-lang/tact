struct OptionalNest1 {
    inner: Int?;
}

struct OptionalNest2 {
    inner: OptionalNest1?;
}

contract OptionalDeepNest {
    data: OptionalNest2;

    init() {
        self.data = OptionalNest2{ inner: null };
    }
}
