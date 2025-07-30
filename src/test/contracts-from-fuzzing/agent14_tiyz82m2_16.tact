struct DefVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "s";
    d: Int?; 
    e: String?;
}

contract DefaultValsTest {
    data: DefVals;

    init() {
        self.data = DefVals{
            d: null,
            e: null
        };
    }
}