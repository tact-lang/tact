struct T {
    field1: Int;
    field2: Int?;
    field3: Bool;
    field4: Bool?;
    field5: String;
    field6: String?;
    field7: Int;
    field8: Int?;
}

contract MixedAll {
    st: T;

    init() {
        self.st = T{
            field1: 1,
            field2: null,
            field3: true,
            field4: null,
            field5: "abc",
            field6: null,
            field7: 2,
            field8: null
        };
    }
}