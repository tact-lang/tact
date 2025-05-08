struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    optI: Int?;
    optB: Bool?;
    optS: String?;
    optAddr: Address?;
}

contract MixedStorage {
    data: ManyTypes;
    
    init() {
        self.data = ManyTypes{
            i: 1,
            b: true,
            s: "hi",
            addr: myAddress(),
            optI: null,
            optB: null,
            optS: null,
            optAddr: null
        };
    }
    
    receive() {
        self.data.i = self.data.i + 1;
    }
}