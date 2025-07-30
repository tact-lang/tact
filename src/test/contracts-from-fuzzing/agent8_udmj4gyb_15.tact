struct Compound {
    flag: Bool;
    optFlag: Bool?;
    name: String;
    optName: String?;
    addr: Address;
    optAddr: Address?;
}

struct Container {
    part: Compound;
    optPart: Compound?;
}

contract TestContract {
    bigField: Container;

    init() {
        self.bigField = Container{
            part: Compound{
                flag: true,
                optFlag: null,
                name: "abc",
                optName: null,
                addr: myAddress(),
                optAddr: null,
            },
            optPart: null
        };
    }
}
