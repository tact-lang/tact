struct OptionalDeep2 {
    inner: Int?;
}

struct Middle2 {
    d: OptionalDeep2?;
}

struct Outer2 {
    m: Middle2?;
}

contract MultiNullable {
    s: Outer2;

    init() {
        self.s = Outer2{
            m: null
        };
    }
}