struct Lvl3 {
    x: Int as uint8;
    y: Int as int16;
}

struct Lvl2 {
    nested: Lvl3;
    z: Int as uint32;
}

struct Lvl1 {
    a: Int;
    inner: Lvl2;
}

contract TestContract {
    val: Lvl1;
    init() {
        self.val = Lvl1{
            a: 1,
            inner: Lvl2{
                nested: Lvl3{
                    x: 255,
                    y: -32768
                },
                z: 4000000000
            }
        };
    }
}