struct Bottom {
    val: Int = 1;
}

struct Middle {
    bottom: Bottom;
    flag: Bool = true;
}

struct Top {
    middle: Middle;
    message: String = "hi";
}

contract TestContract {
    data: Top? = null;

    init() {
        self.data = Top{
            middle: Middle{
                bottom: Bottom{
                    val: 42,
                },
                flag: false,
            },
            message: "hello",
        };
    }
}
