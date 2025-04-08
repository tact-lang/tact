struct Level3 {
    val: Int as uint8;
}

struct Level2 {
    l3: Level3;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
    count: Int as uint32;
}

contract DeepParam(
    data: Level1
) {
    receive() {
        dump(self.data.l2.l3.val);
    }
}