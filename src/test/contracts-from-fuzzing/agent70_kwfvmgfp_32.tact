struct Annotated {
    x: Int as uint32;
    y: Int as int64;
    z: Int as uint8;
}

contract TestContract {
    data: Annotated;

    init() {
        self.data = Annotated{ x:1, y:2, z:3 };
    }

    receive() {
        self.data = Annotated{ x:100, y:200, z:255 };
    }
}