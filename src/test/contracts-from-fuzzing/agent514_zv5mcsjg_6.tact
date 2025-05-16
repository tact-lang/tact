struct Bottom {
    val: Int;
}

struct Middle {
    bottom: Bottom?;
    flag: Bool?;
}

struct Top {
    mid: Middle?;
    text: String?;
}

contract DeepOptional {
    data: Top = Top{
        mid: Middle{
            bottom: Bottom{ val: 1 },
            flag: null,
        },
        text: null,
    };

    init() {
        self.data = Top{
            mid: null,
            text: "initialized",
        };
    }
}