struct Mixed {
    intField: Int;
    optionalBool: Bool?;
    nested: NestedStruct?;
}

struct NestedStruct {
    boolField: Bool;
    optionalInt: Int?;
    deepNested: Deeper?;
}

struct Deeper {
    val: Int;
    flag: Bool?;
}

contract TestContract {
    mixedField: Mixed;

    init() {
        self.mixedField = Mixed{
            intField: 12,
            optionalBool: true,
            nested: NestedStruct{
                boolField: false,
                optionalInt: 34,
                deepNested: Deeper{
                    val: 56,
                    flag: null
                }
            }
        };
    }
}
