struct Flags {
    small: Int as uint4;
    mid: Int as uint16;
}

struct Pack {
    a: Int as uint8;
    switch: Flags;
}

contract NestedSerializations {
    p: Pack;

    init() {
        self.p = Pack{
            a: 12,
            switch: Flags{
                small: 5,
                mid: 400,
            },
        };
    }
}