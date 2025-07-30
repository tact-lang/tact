struct NestedOptionalDefaults {
    a: Level1?;
}
struct Level1 {
    b: Int? = null;
    c: Level2?;
}
struct Level2 {
    d: Int? = null;
}
contract NestedOptionalDefaultsTest {
    data: NestedOptionalDefaults;
    init() {
        self.data = NestedOptionalDefaults{
            a: Level1{
                c: Level2{}
            }
        };
    }
}