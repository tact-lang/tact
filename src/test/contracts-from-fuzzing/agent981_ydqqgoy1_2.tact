struct S1 {
    x: Int;
    y: Bool?;
    s: String;
    o: Int?;
}

contract MultiField {
    field: S1;
    
    init() {
        self.field = S1{
            x: 1,
            y: false,
            s: "a",
            o: null,
        };
    }
}