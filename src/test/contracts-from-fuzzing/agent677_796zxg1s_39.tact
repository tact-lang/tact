struct Bottom {
    text: String?;
    slice: Slice;
}

struct Mid {
    addr: Address;
    bot: Bottom?;
}

struct Top {
    flag: Bool;
    mid: Mid;
}

contract DeepMulti {
    s: Top;

    init() {
        self.s = Top{
            flag: true,
            mid: Mid{
                addr: myAddress(),
                bot: Bottom{
                    text: null,
                    slice: myCode().asSlice(),
                }
            }
        };
    }
}