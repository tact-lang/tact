struct IntBoolString {
    x: Int;
    y: Bool;
    z: String;
}

contract MixedStructFields {
    data: IntBoolString;
    init() {
        self.data = IntBoolString{ x:1, y:true, z:"z" };
    }
}