struct DeeplyNested {
    inner: Level1;
}

struct Level1 {
    inner: Level2;
}

struct Level2 {
    flag: Bool;
    num: Int;
    text: String;
}

contract TestContract {
    val: DeeplyNested;

    init() {
        self.val = DeeplyNested{ inner: Level1{ inner: Level2{ flag: true, num: 10, text: "hello" } } };
    }
}
