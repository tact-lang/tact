struct Inner {
    x: Int;
    y: Int?;
    z: Bool;
}

contract TestContract {
    coord: Inner;
    
    init() {
        self.coord = Inner{ x: 1, y: 2, z: true };
    }
}