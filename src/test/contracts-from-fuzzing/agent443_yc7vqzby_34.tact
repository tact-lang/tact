struct Tiny {
    x: Int as uint1; // 1 bit
    y: Bool;
}

contract TinyBitTest {
    t: Tiny;

    init() {
        self.t = Tiny{
            x:1,
            y:true
        };
    }
}