struct StructWithManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: Address;
    f7: Int?;
    f8: map<Int, Int>;
    f9: map<Address, Bool>;
    f10: String?;
}

contract ManyFieldsContract {
    data: StructWithManyFields;

    init() {
        self.data = StructWithManyFields{
            f1: 1,
            f2: 2,
            f3: false,
            f4: true,
            f5: "hello",
            f6: myAddress(),
            f7: null,
            f8: emptyMap(),
            f9: emptyMap(),
            f10: null,
        };
    }

    receive() {
        dump(self.data.f1);
        dump(self.data.f6);
    }
}