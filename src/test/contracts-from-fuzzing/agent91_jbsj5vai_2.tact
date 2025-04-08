struct ExampleStruct {
    num: Int;
    active: Bool;
    count: Int;
    flag: Bool;
    value: Int;
    extra: Bool;
}

contract ManyFieldsContract {
    data: ExampleStruct;

    init() {
        self.data = ExampleStruct{
            num: 1,
            active: true,
            count: 2,
            flag: false,
            value: 3,
            extra: true
        };
    }
}
