struct OddWidths {
    x: Int as int7;
    y: Int as uint13;
    z: Int as int1;
    flag1: Bool;
    flag2: Bool;
}

contract TestContract {
    data: OddWidths;

    init() {
        self.data = OddWidths{
            x: -64,
            y: 8191,
            z: -1,
            flag1: true,
            flag2: false,
        };
    }

    receive() {
        let sum = self.data.x + self.data.y + self.data.z + (self.data.flag1 ? 1 : 0) + (self.data.flag2 ? 1 : 0);
    }
}