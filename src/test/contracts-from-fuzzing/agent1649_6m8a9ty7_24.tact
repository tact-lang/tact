message(99) InnerMsg {
    x: Int;
}

struct Mid {
    m: InnerMsg?;
    flag: Bool;
}

struct Top {
    mid: Mid?;
    label: String;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            label: "ok",
            mid: Mid{
                flag: true,
                m: null,
            },
        };
    }
}