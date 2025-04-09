struct OptionalTest {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract NullableFields {
    field: OptionalTest;

    init() {
        self.field = OptionalTest{x:null,y:null,z:null};
    }
}