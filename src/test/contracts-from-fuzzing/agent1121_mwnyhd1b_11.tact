struct MixedNullable {
    x: Int;
    y: Bool?;
    z: String;
}

contract MixedNullableTest {
    data: MixedNullable;

    init() {
        self.data = MixedNullable{
            x: 5,
            y: null,
            z: "hello",
        };
    }
}