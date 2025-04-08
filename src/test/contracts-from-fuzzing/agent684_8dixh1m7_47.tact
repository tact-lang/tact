struct StructWithManyDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "";
    o: Int?;
}

contract ManyDefaultsTest {
    field: StructWithManyDefaults;
    init() {
        self.field = StructWithManyDefaults { o:null };
    }
}