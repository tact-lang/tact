struct Deeply {
    text: String;
    flag: Bool;
}

struct Mid {
    deep: Deeply;
}

struct Top {
    mid: Mid;
}

contract DeepText {
    content: Top;

    init() {
        self.content = Top{ mid: Mid{ deep: Deeply{ text: "deep", flag: true } } };
    }
}