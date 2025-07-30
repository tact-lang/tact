// Struct with a slice remaining, contract initializes only in init()
struct HasRem {
    prefix: Int = 1;
    rest: Slice as remaining;
}

contract TestContract {
    s: HasRem;

    init() {
        self.s = HasRem{prefix: 99, rest: emptyCell().asSlice()};
    }

    receive() {
        let _ = self.s.prefix;
        let _ = self.s.rest;
    }
}