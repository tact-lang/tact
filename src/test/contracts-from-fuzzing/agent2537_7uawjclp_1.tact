struct Coordinates {
    x: Int as int64;
    y: Int as int64;
}

contract StoreNested {
    location: Coordinates;
    
    init() {
        self.location = Coordinates{ x: 1234567890, y: -987654321 };
    }
}