struct Defaulted {
    x: Int = 1;
    y: Bool = false;
    z: String = "hello";
}

contract StructWithDefaults {
    myField: Defaulted;

    init() {
        self.myField = Defaulted{ x:10, y:true, z:"world" };
    }
}