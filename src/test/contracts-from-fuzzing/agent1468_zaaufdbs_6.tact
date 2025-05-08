struct Info {
    a: Int = 5;
    b: Int?;
    c: String = "hi";
    d: Bool?;
}

contract TestContract {
    record: Info;

    init() {
        self.record = Info{
            b: null,
            d: null,
        };
    }
}