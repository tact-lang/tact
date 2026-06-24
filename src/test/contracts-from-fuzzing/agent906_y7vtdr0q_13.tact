struct Sized {
    x: Int as uint32;
    y: Int as int8;
    z: Int as uint1;
}

contract SerializedTypes {
    data: Sized;

    init() {
        self.data = Sized{
            x: 100,
            y: -5,
            z: 1,
        };
    }
}