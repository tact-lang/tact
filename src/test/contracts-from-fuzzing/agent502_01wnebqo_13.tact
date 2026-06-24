struct SerialTest {
    x: Int as int64;
    y: Int as uint32;
    z: Int as coins;
}

contract TestContract {
    data: SerialTest;

    init() {
        self.data = SerialTest{x:-1,y:100,z:100000};
    }
}