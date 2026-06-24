struct NestedOpt {
    inn: Int?;
}

struct MidStruct {
    middle: NestedOpt;
    another: Bool;
}

struct OuterStruct {
    header: Int;
    nested: MidStruct;
    tail: String;
}

contract TestContract {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{
            header: 1,
            nested: MidStruct{
                middle: NestedOpt{inn: null},
                another: true
            },
            tail: "end"
        };
    }
}