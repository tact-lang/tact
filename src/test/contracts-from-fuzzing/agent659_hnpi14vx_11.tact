struct Deepest {
    value: Int;
}

struct Middle {
    deep: Deepest?;
}

struct Top {
    mid: Middle?;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            mid: null,
        };
    }
}