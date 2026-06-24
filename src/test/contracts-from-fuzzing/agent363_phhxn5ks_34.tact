message DeepMsg {
    secret: String?;
}

struct Bottom {
    a: Int?;
    b: Bool;
    c: DeepMsg?;
}

struct Middle {
    flag: Bool?;
    inner: Bottom;
}

struct Top {
    num: Int;
    mid: Middle;
    txt: String?;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            num: 123,
            mid: Middle{
                flag: true,
                inner: Bottom{
                    a: null,
                    b: false,
                    c: DeepMsg{secret:null}
                }
            },
            txt: "hi"
        };
    }

    receive() {}
}