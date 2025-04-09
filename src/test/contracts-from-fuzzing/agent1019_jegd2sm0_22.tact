struct Level3 {
    a: Int;
    b: Bool;
}
struct Level2 {
    l3: Level3;
}
struct Level1 {
    l2: Level2;
}

contract TestContract(
    l1: Level1,
) {
    receive() {
        dump(self.l1.l2.l3.a);
    }
}