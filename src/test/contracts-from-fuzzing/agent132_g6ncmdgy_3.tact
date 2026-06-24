struct OptStruct { a: Int?; b: Bool?; c: String?; }

contract OptionalsTest {
    opts: OptStruct;

    init() {
        self.opts = OptStruct{ a: null, b: true, c: "hello" };
    }
}