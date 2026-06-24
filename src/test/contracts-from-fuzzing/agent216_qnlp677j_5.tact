struct ContainsOptionalStruct {
    f1: OptionStruct?;
}

struct OptionStruct {
    x: Int;
    y: Bool;
}

contract OptionalStructTest {
    val: ContainsOptionalStruct;

    init() {
        self.val = ContainsOptionalStruct{
            f1: null
        };
    }
}