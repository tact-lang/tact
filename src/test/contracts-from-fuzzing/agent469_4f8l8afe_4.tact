struct NestedOpt {
    foo: Int;
    bar: Bool?;
    note: String;
    tail: Tail?;
}

struct Tail {
    flag: Bool;
    count: Int?;
    message: String?;
}

contract NestedOptionalContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            foo: 7,
            bar: null,
            note: "note",
            tail: Tail{
                flag: true,
                count: null,
                message: null,
            },
        };
    }
}
