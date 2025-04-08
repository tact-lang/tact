struct MyStruct { i: Int }

contract OptionalDefaults {
    x: Int?;
    y: MyStruct?;
    z: Bool?;

    receive() {
        let _ = self.x;
    }
}