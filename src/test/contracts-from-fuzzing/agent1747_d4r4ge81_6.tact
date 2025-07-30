struct Deep {
    val: Int;
}

struct Mid {
    deep: Deep;
}

struct Top {
    mid: Mid;
}

contract DeepNoDefault {
    item: Top = Top{ mid: Mid{ deep: Deep{ val: 77 } } };

    init() {}
}