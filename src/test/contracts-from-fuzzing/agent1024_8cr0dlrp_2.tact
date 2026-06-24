struct Deep {
    alpha: Int = 1;
    beta: Bool = false;
    gamma: String?;
}

struct Mid {
    deep: Deep = Deep{};
    delta: String = "hi";
}

struct Top {
    mid: Mid = Mid{};
    epsilon: Int = 5;
}

contract ComplexStorage {
    top: Top = Top{};

    init() {
        self.top = Top{
            mid: Mid{
                deep: Deep{
                    alpha: 42,
                    beta: true,
                    gamma: "nested!",
                },
                delta: "mid",
            },
            epsilon: 10,
        };
    }
}