struct Test {
    a: Int?;
    b: Bool = true;
}

contract PartialOpt {
    x: Test;
    init() {
        self.x = Test{};
    }
}