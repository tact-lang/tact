struct OptionalStructField {
    innerOpt: Int?;
}

struct OuterWithOptStruct {
    someOpt: OptionalStructField?;
}

contract NestedOptionalStructTest {
    val: OuterWithOptStruct;

    init() {
        self.val = OuterWithOptStruct{
            someOpt: OptionalStructField{
                innerOpt: 101
            }
        };
    }

    receive() {}
}