struct HasString {
    s: String;
}

struct HasInt {
    i: Int;
}

struct Combo {
    str: HasString;
    int: HasInt;
}

contract TestContract {
    value: Combo;
    init() {
        self.value = Combo{
            str: HasString{ s: "ok" },
            int: HasInt{ i: 99 }
        };
    }
}