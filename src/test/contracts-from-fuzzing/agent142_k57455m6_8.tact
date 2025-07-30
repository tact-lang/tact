struct Lowest {
    a: Int;
    b: Bool;
}

struct Mid {
    low: Lowest;
    label: String;
}

struct Top {
    mid: Mid;
    index: Int;
}

contract TestContract {
    item: Top = Top{
        mid: Mid{
            low: Lowest{
                a: 777,
                b: true,
            },
            label: "deep",
        },
        index: 42,
    };

    init() {}

    receive() {}
}