struct Inner {
    y: Int;
    z: Bool?;
}

contract TestContract {
    data: Inner; 
    init() {
        self.data = Inner{ y: 123, z: null };
    }
    receive() {
        self.data = Inner{ y: 456, z: true };
    }
}