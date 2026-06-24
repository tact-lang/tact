struct SOptional {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract OptStructField {
    data: SOptional;
    
    init() {
        self.data = SOptional{
            x: null,
            y: null,
            z: null,
        };
    }
}