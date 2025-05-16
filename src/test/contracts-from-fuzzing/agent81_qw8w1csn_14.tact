struct Level1 {
    x: Int;
}

struct Level2 {
    inner: Level1;
    y: Bool;
}

struct Level3 {
    l2: Level2;
    z: Int;
}

contract TestDeep {
    value: Int = 99;

    receive() {}

    get fun getDeep(): Level3 {
        return Level3{
            l2: Level2{
                inner: Level1{ x: self.value },
                y: false
            },
            z: self.value + 1
        };
    }
}
