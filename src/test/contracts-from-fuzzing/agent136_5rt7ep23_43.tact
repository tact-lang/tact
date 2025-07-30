struct Tiny {
    x: Int as uint4;
    y: Bool;
    z: Int as int8;
}

contract TinyStructs {
    data: Tiny;

    init() {
        self.data = Tiny{ x:13, y:true, z:-7 };
    }
}