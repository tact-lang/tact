struct OptionalDeep1 {
    a: OptionalDeep2?;
}

struct OptionalDeep2 {
    b: OptionalDeep3?;
}

struct OptionalDeep3 {
    c: Int?;
}

contract OptionalDeepTest {
    data: OptionalDeep1;
    init() {
        self.data = OptionalDeep1{
            a: null
        };
    }
}