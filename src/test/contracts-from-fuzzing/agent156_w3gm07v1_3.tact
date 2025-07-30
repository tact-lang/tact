struct Info {
    x: Int;
    y: Bool;
}

contract OptionalStructField {
    data: Info?;
    
    init() {
        self.data = Info{
            x: 42,
            y: true
        };
    }
}