struct BigNestedA {
    field1: Int;
    field2: Bool;
    field3: BigNestedB;
}

struct BigNestedB {
    field4: Int;
    field5: BigNestedC;
}

struct BigNestedC {
    field6: Int;
    field7: Bool;
    field8: String;
    field9: Address;
}

contract BigComplexNested {
    data: BigNestedA;
    init() {
        self.data = BigNestedA {
            field1: 1,
            field2: true,
            field3: BigNestedB {
                field4: 2,
                field5: BigNestedC {
                    field6: 3,
                    field7: false,
                    field8: "Test",
                    field9: myAddress()
                }
            }
        };
    }
}