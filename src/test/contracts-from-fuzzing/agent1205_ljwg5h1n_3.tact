struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Bool;
    f5: Int;
    f6: Bool;
    f7: Int;
    f8: Bool;
    f9: Int;
    f10: Bool;
}

contract TestContract {
    large: LargeStruct;
    
    init() {
        self.large = LargeStruct{
            f1: 1, f2: true, f3: 2, f4: false, f5: 3,
            f6: true, f7: 4, f8: false, f9: 5, f10: true
        };
    }
}