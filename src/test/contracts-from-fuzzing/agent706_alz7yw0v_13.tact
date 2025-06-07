struct Mix {
    number: Int;
    optBool: Bool?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
    stringVal: String;
}

contract TestContract {
    m: Mix;

    init() {
        self.m = Mix{
            number: 100,
            optBool: null,
            optAddr: null,
            optSlice: null,
            optCell: null,
            stringVal: "data"
        };
    }
}