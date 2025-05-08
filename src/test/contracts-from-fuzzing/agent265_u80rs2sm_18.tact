struct EmptyOptionalStrings {
    field1: String?;
    field2: String?;
}

contract ManyOptStr {
    optstrs: EmptyOptionalStrings;

    init() {
        self.optstrs = EmptyOptionalStrings{
            field1: null,
            field2: null
        };
    }

    receive() {
        self.optstrs = self.optstrs;
    }
}