struct StrNestedOpt {
    txt: String?;
    intVal: Int;
}

contract StrOptInStruct {
    val: StrNestedOpt;

    init() {
        self.val = StrNestedOpt{
            txt: null,
            intVal: 3
        };
    }
}