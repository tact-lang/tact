struct Mix {
    a: Int;
    b: Bool?;
}

contract Test {
    field: Mix;
    
    init() {
        self.field = Mix{
            a:123,
            b:null
        };
    }
}