struct Deep {
    level3: Int;
}

struct Middle {
    deep: Deep;
}

struct Top {
    middle: Middle;
}

contract Test3 {
    storage: Top;
    
    init() {
        self.storage = Top{ middle: Middle{ deep: Deep{ level3: 42 } } };
    }
}