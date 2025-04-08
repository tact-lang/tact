struct Deep {
    desc: String;
    count: Int as uint64;
}

struct Mid {
    deep: Deep;
}

contract TestContract {
    storage: Mid;

    init() {
        self.storage = Mid{ deep: Deep{desc: "desc", count: 77} };
    }
}