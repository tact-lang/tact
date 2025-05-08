struct Info {
    id: Int;
    active: Bool;
}

contract TestContract {
    count: Int = 0;
    optInfo: Info? = null;

    init() {
        self.count = 123;
        self.optInfo = Info{id: 42, active: true};
    }
}