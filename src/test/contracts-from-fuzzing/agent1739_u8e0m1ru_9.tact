struct ContainsManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Int?;
    o7: Int?;
    o8: Int?;
    o9: Int?;
    o10: Int?;
}

contract ManyOptionals {
    optStruct: ContainsManyOptionals;
    
    init() {
        self.optStruct = ContainsManyOptionals{
            o1: null, o2: 2, o3: null, o4: 4, o5: null, o6: 6, o7: null, o8: 8, o9: null, o10: 10,
        };
    }
}