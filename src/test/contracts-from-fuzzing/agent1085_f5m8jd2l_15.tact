struct NestedOptionalFields {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Cell?;
    opt5: Address?;
}

struct Wrapper {
    nested: NestedOptionalFields?;
}

contract OptionalInOptional {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: NestedOptionalFields{
                opt1: 10,
                opt2: null,
                opt3: "str",
                opt4: emptyCell(),
                opt5: myAddress()
            }
        };
    }
}