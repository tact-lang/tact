struct Deepest {
    x: Int?;
}

struct Inner {
    deep: Deepest?;
}

contract Test {
    val: Inner?;

    init() {
        self.val = Inner{ deep: null };
    }
}