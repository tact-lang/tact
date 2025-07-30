struct I64Fields {
    x: Int as int64;
    y: Int as int64;
    z: Int;
}

contract TestContract {
    chunk: I64Fields;
    init() {
        self.chunk = I64Fields{x:1,y:2,z:3};
    }
}