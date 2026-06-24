struct Sub {
    foo: Int as uint8;
}

struct Main {
    sval: Int as uint256;
    opt: Sub?;
    flag: Bool;
}

contract Test31 {
    data: Main;

    init() {
        self.data = Main{
            sval: 1,
            opt: null,
            flag: true,
        };
    }
}