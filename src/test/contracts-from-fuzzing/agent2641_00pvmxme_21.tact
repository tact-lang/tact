struct OneField {
    s: Int;
}

struct UseOne {
    field1: OneField;
    field2: OneField;
    field3: OneField;
}

contract MultipleSameStruct {
    st: UseOne;

    init() {
        self.st = UseOne{
            field1: OneField{ s: 1 },
            field2: OneField{ s: 2 },
            field3: OneField{ s: 3 },
        };
    }
}