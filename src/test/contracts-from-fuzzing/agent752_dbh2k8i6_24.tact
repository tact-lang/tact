struct DeepOpt {
    a: Int?;
}

struct Layer1 {
    d: DeepOpt?;
}

contract DoubleOptionTest {
    test: Layer1;

    init() {
        self.test = Layer1{ d: null };
    }
}