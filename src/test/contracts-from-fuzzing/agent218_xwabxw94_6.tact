struct Deep {
    val: Int = 99;
    flag: Bool?; // defaults to null
}

struct Middle {
    deep: Deep;
    text: String = "hi";
}

contract NestedDefaults {
    m: Middle;

    init() {
        self.m = Middle{ deep: Deep{} };
    }
}