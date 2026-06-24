struct DeeplyNestedOptional {
    one: Int?;
    two: Layer2?;
}

struct Layer2 {
    three: Bool?;
    four: Layer3?;
}

struct Layer3 {
    five: Int?;
}

contract DeepNestedOptStruct {
    data: DeeplyNestedOptional;
    
    init() {
        self.data = DeeplyNestedOptional{one: null, two: null};
    }
    
    receive() {
        self.data = DeeplyNestedOptional{
            one: 1,
            two: Layer2{
                three: true,
                four: Layer3{five: 999}
            }
        };
    }
}