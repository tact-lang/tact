struct MultiOption {
    value1: Int?;
    value2: Int?;
    value3: Int?;
}

contract TestContract {
    m: MultiOption;
    init() {
        self.m = MultiOption{
            value1:null,
            value2:null,
            value3:null,
        };
    }
}
