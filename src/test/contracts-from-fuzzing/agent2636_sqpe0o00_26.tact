struct OptionalNest {
    s: InnerSub?;
}
struct InnerSub {
    n: Int;
}
contract OptionalNestTest {
    val: OptionalNest;

    init() {
        self.val = OptionalNest{
            s: InnerSub{ n: 1 },
        };
    }
}