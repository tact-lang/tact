struct Deeply {
    text: String?;
}

struct Mid {
    deep: Deeply?;
}

struct Top {
    name: String;
    alias: String?;
    inner: Mid;
}

contract NestedStrings {
    info: Top;

    init() {
        self.info = Top{
            name: "Alex",
            alias: null,
            inner: Mid{ deep: null }
        };
    }
}