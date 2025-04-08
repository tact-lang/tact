struct Reordered {
    z: Int;
    a: Bool;
    m: String;
    b: Slice;
}

contract OrderTest {
    val: Reordered;
    init() {
        self.val = Reordered{
            z: 9,
            a: true,
            m: "hi",
            b: emptyCell().asSlice()
        };
    }
}