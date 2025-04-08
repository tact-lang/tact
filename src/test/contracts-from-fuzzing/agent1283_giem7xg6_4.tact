struct Bottom {
    val: Int;
}

struct Middle {
    b: Bottom;
    flag: Bool?;
}

struct Top {
    mid: Middle;
    s: String;
}

contract DeepStructs {
    data: Top;

    init() {
        self.data = Top{
            mid: Middle{
                b: Bottom{
                    val: 42,
                },
                flag: null,
            },
            s: "hello",
        };
    }
}