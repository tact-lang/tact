struct MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "preset";
    d: Cell;
    e: Int?;
    f: String? = null;
}

contract MixedDefaultsTest {
    data: MixedDefaults;
    init() {
        self.data = MixedDefaults{
            b: true,
            d: emptyCell(),
            e: 42,
        };
    }
}