struct InnerStruct {
    val1: Int;
    val2: Bool?;
}

struct OuterStruct {
    nested: InnerStruct;
    flag: Bool;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: InnerStruct{
                val1: 42,
                val2: true,
            },
            flag: false,
        };
    }

    receive() {
        // Access nested optional value
        if (self.data.nested.val2 != null) {
            dump(self.data.nested.val2!!);
        }
    }
}