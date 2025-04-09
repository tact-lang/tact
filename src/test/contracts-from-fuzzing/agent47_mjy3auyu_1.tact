struct S1 { a: Int; b: Bool; c: Address; d: String; }

contract Test {
    data: S1;
    init() {
        self.data = S1{ a: 1, b: true, c: myAddress(), d: "test" };
    }
}