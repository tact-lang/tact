struct BigOpt {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
}

contract TestContract {
    data: BigOpt?;

    init() {
        self.data = null;
    }

    receive() {
        let _ = self.data;
    }
}