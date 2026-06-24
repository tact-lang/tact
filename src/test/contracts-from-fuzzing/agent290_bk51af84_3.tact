struct Info {
    flag: Bool?;
    data: Int?;
}

contract Test {
    info: Info;

    init() {
        self.info = Info{ flag: null, data: null };
    }
}