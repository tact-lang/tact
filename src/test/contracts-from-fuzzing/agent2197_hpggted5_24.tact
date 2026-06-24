struct DefaultVals {
    a: Int = 10;
    b: Bool = true;
    c: Int?;
    d: Bool?;
}

contract Defaults {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{
            c: null,
            d: null
        };
    }
}