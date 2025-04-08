struct StructWithOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFieldsTest {
    myStruct: StructWithOptionals;

    init() {
        self.myStruct = StructWithOptionals{
            x: null,
            y: true,
            z: null,
        };
    }
}