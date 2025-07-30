struct Holder {
    addr: Address?;
    flag: Bool;
}

contract TestContract {
    h: Holder;

    init() {
        self.h = Holder {
            addr: null,
            flag: true,
        };
    }
}