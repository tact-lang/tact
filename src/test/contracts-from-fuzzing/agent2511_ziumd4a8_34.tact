struct NestedDefaults {
    a: Int = 100;
    b: Bool = true;
    c: String = "abc";
}

struct OuterDefaults {
    n: NestedDefaults;
    z: String;
}

contract NestedDefaultsTest {
    data: OuterDefaults;

    init() {
        self.data = OuterDefaults{
            n: NestedDefaults{},
            z: "zzz"
        };
    }
}