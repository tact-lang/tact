struct Inner {
    val1: Int;
    val2: Int?;
}

contract TestStorage {
    point: Inner;
    
    init() {
        self.point = Inner{ val1: 10, val2: null };
    }
}