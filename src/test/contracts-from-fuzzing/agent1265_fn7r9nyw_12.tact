struct NestedBool {
    f1: Bool;
    f2: Bool?;
    f3: Bool;
    f4: Bool?;
    f5: Bool;
}

contract ManyBools {
    state: NestedBool;

    init() {
        self.state = NestedBool{
            f1:true, f2:null, f3:false, f4:null, f5:true
        };
    }
}