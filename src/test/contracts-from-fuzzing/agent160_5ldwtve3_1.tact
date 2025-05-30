struct Inner {
    x: Int;
    y: Int?;
}

contract TestStorage {
    point: Inner;
    
    init() {
        self.point = Inner{
            x: 1,
            y: null,
        };
    }
}