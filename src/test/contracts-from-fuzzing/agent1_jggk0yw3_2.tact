struct Inner {
    x: Int;
    y: Bool;
    z: Address;
}

contract Nested {
    data: Inner;
    
    init() {
        self.data = Inner{
            x: 1,
            y: false,
            z: myAddress(),
        };
    }
}