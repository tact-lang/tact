struct InnerOptAll {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: InnerOptAll;

    init() {
        self.data = InnerOptAll{ a: null, b: null, c: null };
    }
}