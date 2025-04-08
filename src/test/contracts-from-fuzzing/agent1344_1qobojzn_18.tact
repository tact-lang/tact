struct NumTypes {
    x: Int as int64;
    y: Int as uint16;
    z: Int as int8;
}

contract SerializationWidths {
    val: NumTypes;

    init() {
        self.val = NumTypes{x:10,y:20,z:-5};
    }
}
