struct NestedOptStruct {
    opt1: Int?;
    opt2: Bool?;
    opt3: Cell?;
    opt4: Address?;
    opt5: Slice?;
    opt6: String?;
}

contract NestedOptionals {
    param: NestedOptStruct?;

    init() {
        self.param = NestedOptStruct{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
            opt6: null
        };
    }
}
