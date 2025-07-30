struct DeepInner {
    x: Int;
    y: Int;
}

struct Mid {
    deep: DeepInner;
}

struct Outer {
    mid: Mid;
    flag: Bool;
}

contract DeepNestedStructs {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: Mid{ deep: DeepInner{ x: 1, y: 2 } },
            flag: true
        };
    }
}