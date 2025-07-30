struct ZeroDefaults {
    x: Int = 0;
    y: Int = 0;
    z: Int = 0;
}

contract Defs {
    val: ZeroDefaults;

    init() {
        self.val = ZeroDefaults{ x:0,y:0,z:0 };
    }
}