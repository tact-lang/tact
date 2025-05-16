struct Deep {
    n1: Level1;
}

struct Level1 {
    n2: Level2;
    s1: String;
}

struct Level2 {
    b: Bool;
    i: Int;
    s2: String;
}

contract Test(
    deep: Deep,
) {
    receive() {
        let _ = self.deep.n1.n2.i + self.deep.n1.n2.i;
    }
}
