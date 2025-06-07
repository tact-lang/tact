struct ParamSet {
    number: Int;
    optBool: Bool?;
    message: String;
}

contract StorageInit {
    p: ParamSet;

    init() {
        self.p = ParamSet{
            number: 100,
            optBool: null,
            message: "abc"
        };
    }
}