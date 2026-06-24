struct Around {
    a: Bool;
    b: Int?;
    c: Int;
}

contract OptionalBetween {
    data: Around;
    
    init() {
        self.data = Around{
            a: true,
            b: null,
            c: 123,
        };
    }
}
