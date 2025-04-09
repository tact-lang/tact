struct DefVals {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultsStruct {
    data: DefVals;

    init() {
        self.data = DefVals{}; 
    }
}