struct StructWithDefault {
    a: Int;
    b: Bool = true;
    c: String = "hi";
    d: Int?;
    e: Bool?;
}

contract DefaultFieldsTest {
    data: StructWithDefault;
    init() {
        self.data = StructWithDefault{
            a:42,
            d:null,
            e:null
        };
    }
}