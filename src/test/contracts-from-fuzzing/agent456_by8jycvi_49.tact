struct InnerMost {
    flag: Bool;
}

struct Mid {
    inner: InnerMost;
}

contract MidNestedContract {
    data: Mid;

    init() {
        self.data = Mid{ inner: InnerMost{ flag:false } };
    }
}