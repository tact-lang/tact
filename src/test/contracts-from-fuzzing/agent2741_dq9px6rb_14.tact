struct ManyDefaults {
    p1: Int = 1;
    p2: Int = 2;
    p3: Bool = false;
    p4: String = "test";
    p5: Int?; // defaults to null
}

contract StructDefaultsTest {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{}; // use only defaults/nulls
    }
}