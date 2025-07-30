struct Nested {
    x: Int;
    y: Bool;
    z: Address;
    optVal: String?;
    nestedOpt: Bool?;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            x: 0,
            y: true,
            z: myAddress(),
            optVal: null,
            nestedOpt: false,
        };
    }

    receive() {
        self.data = self.data;
    }
}