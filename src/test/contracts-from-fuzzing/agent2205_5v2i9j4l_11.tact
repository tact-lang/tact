struct DefaultFields {
    num: Int = 1;
    flag: Bool = false;
    optVal: Int?;
}

contract MixedDefaults {
    s: DefaultFields;
    
    init() {
        self.s = DefaultFields{
            num: 7, flag: true, optVal: null
        };
    }
}