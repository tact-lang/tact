struct MultiDefaulted {
    a: Int = 5;
    b: Bool = true;
    c: Int?;
    d: Bool?;
}

contract TestContract {
    data: MultiDefaulted;

    init() {
        self.data = MultiDefaulted{};
    }
}