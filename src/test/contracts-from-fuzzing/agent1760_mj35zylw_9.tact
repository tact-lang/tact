struct MyStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract OptField {
    s: MyStruct?;

    init() {
        self.s = null;
    }
}