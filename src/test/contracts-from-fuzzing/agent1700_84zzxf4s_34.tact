struct NestedOptionStruct {
    optInt: Int?;
    optBool: Bool?;
    txt: String;
}

contract OptStructInOpt {
    data: NestedOptionStruct?;

    init() {
        self.data = NestedOptionStruct{
            optInt: 55,
            optBool: true,
            txt: "hello"
        };
    }
}
