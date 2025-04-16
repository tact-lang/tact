struct TupleStruct {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
    flag: Bool = false;
}

contract TupleTest {
    pos: TupleStruct;

    init() {
        self.pos = TupleStruct{
            x: 7, y: 8, z: 9, flag: true
        };
    }

    receive() {
        let _ = self.pos;
    }
}