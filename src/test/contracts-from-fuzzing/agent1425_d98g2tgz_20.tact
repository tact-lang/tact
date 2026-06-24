// test struct with large number of defaults of various kinds
struct MixDefaults {
    a: Int = 1;
    b: Int? = null;
    c: String = "";
    d: String? = null;
    e: Bool = true;
    f: Bool? = null;
    g: Address? = null;
    h: Cell? = null;
    i: Builder? = null;
    j: Slice? = null;
}

contract MixDefaultsTest {
    data: MixDefaults;
    init() {
        self.data = MixDefaults{};
    }
}