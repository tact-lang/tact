struct OptionalDeep1 {
    v: Int?;
}

struct OptionalDeep2 {
    inner: OptionalDeep1?;
}

struct OptionalDeep3 {
    inner: OptionalDeep2?;
}

contract OptionalLevels {
    root: OptionalDeep3;
    init() {
        self.root = OptionalDeep3{
            inner: OptionalDeep2{
                inner: OptionalDeep1{ v: null }
            }
        };
    }
}