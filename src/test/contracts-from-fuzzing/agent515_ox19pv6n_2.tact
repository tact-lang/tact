struct Inner {
    x: Int = 5;
    y: String = "hello";
    z: Bool?; // default null
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{}; // rely on defaults in struct
    }

    receive() {
        let _x = self.data.x;
        let _y = self.data.y;
        let _z = self.data.z;
    }
}