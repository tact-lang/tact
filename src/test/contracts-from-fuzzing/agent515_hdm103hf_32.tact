// Deep optional wrapping primitive inside structs
struct Inner {
    n: Int?;
}
struct Mid {
    inner: Inner?;
}
struct Outer {
    mid: Mid?;
}

contract OptionalTower {
    outer: Outer?;

    init() {
        self.outer = Outer{
            mid: Mid{
                inner: Inner{
                    n: null
                }
            }
        };
    }
}