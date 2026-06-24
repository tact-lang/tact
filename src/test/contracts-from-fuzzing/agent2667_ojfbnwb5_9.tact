struct ManyOptionalNested {
    one: Int?;
    two: InnerOpt?;
    three: Bool?;
}

struct InnerOpt {
    nested: Bool?;
    val: Int?;
}

contract ManyOptionals {
    data: ManyOptionalNested;
    
    init() {
        self.data = ManyOptionalNested{one: null, two: null, three: null};
    }
    
    receive() {
        self.data = ManyOptionalNested{
            one: 5,
            two: InnerOpt{nested: true, val: 7},
            three: false
        };
    }
}