struct OptionalStruct {
    nested: InnerStruct?;
}

struct InnerStruct {
    num: Int;
}

contract TestContract {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{
            nested: null
        };
    }

    receive() {
        let _ = self.val.nested;
    }
}