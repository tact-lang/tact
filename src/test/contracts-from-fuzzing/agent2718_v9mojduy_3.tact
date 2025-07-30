struct TestStruct {
    x: Int;
    y: Bool;
    z: String;
    o: Int?;
}

contract ManyTypes {
    field: TestStruct = TestStruct{
        x: 1,
        y: true,
        z: "hello",
        o: null,
    };
}