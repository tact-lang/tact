// Struct nesting with varying optionality and default values
struct Deep {
    a: Int = 1;
    b: Bool?;
    c: String?;
}

struct Mid {
    deep: Deep;
    s: String = "hello";
}

struct Top {
    mid: Mid?;
    flag: Bool = false;
}

contract NestedOptionalsDefaults {
    state: Top;

    init() {
        self.state = Top{ mid: Mid{ deep: Deep{ b: true, c: null }, s: "hi" }, flag: true };
    }
}
