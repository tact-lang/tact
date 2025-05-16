struct Deep {
    next: Int;
}

struct Middle {
    deep: Deep;
}

struct Top {
    mid: Middle;
}

contract HighlyNested {
    val: Top;
    init() {
        self.val = Top{ mid: Middle{ deep: Deep{ next: 99 } } };
    }
}