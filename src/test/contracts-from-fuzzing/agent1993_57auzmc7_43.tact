struct BothOptions {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    bo: BothOptions?;

    init() {
        self.bo = null;
    }
}