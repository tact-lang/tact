struct Deep3 {
    val: Int;
}

struct Deep2 {
    deep3: Deep3;
}

struct Deep1 {
    deep2: Deep2;
}

contract TestContract {
    deep: Deep1;

    init() {
        self.deep = Deep1{ deep2: Deep2{ deep3: Deep3{ val: 999 } } };
    }
}