struct Mixed {
    a: Int = 11;
    b: Bool = false;
    c: String = "Abc";
    d: Int?;        // optional, default null
    e: String?;     // optional, default null
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{};
    }
}