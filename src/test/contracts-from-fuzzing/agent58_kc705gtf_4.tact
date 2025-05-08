struct DefaultsAndNullable {
    x: Int = 123;
    y: Bool?;
    z: String = "hello";
}

contract StructWithDefaults {
    myState: DefaultsAndNullable;

    init() {
        self.myState = DefaultsAndNullable{
            y: null,
        };
    }
}