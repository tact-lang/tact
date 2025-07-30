struct Reordered {
    b: Address;
    a: Int;
    c: String;
}

contract OrderPersistTest {
    s: Reordered;

    init() {
        self.s = Reordered{ b: myAddress(), a: 1, c: "hi" };
    }
}
