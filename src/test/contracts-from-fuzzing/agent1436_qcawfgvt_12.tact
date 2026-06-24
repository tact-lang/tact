struct HasString {
    s: String;
}

struct HasAddress {
    a: Address;
}

struct HasSlice {
    sl: Slice;
}

struct Wrapper {
    s: HasString;
    a: HasAddress;
    sl: HasSlice;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            s: HasString{s: "z"},
            a: HasAddress{a: myAddress()},
            sl: HasSlice{sl: emptyCell().asSlice()},
        };
    }
}
