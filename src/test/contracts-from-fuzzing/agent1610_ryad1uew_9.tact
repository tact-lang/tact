struct NestedOptionInStruct {
    payload: String?;
}

contract TestOptionStructField {
    myField: NestedOptionInStruct;

    init() {
        self.myField = NestedOptionInStruct{
            payload: null
        };
    }
}