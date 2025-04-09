struct OptionalOne {
    sub: Sub?;
}
struct Sub {
    val: Int;
}
contract OptionalOneTest {
    s: OptionalOne;
    init() {
        self.s = OptionalOne{
            sub: Sub{val:5}
        };
    }
}
