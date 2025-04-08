struct Info {
    name: String = "Name";
    count: Int = 0;
    flag: Bool = false;
}

contract Test {
    data: Info;
    init() {
        self.data = Info{count: 5};
    }
}
