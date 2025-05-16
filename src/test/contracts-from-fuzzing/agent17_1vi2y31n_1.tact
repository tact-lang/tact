struct SimpleStruct { a: Int; b: Bool; c: String }

contract TestContract {
    s: SimpleStruct;

    init() {
        self.s = SimpleStruct{ a: 1, b: true, c: "hi" };
    }
}