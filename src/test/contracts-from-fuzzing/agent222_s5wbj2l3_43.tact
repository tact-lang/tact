struct Mid {
    x: Int;
}

struct Top {
    mid: Mid;
}

contract DeepDefaultOverwrite {
    value: Top = Top{ mid: Mid{ x: 1 } };

    init() {
        self.value = Top{ mid: Mid{ x: 2 } };
    }
}