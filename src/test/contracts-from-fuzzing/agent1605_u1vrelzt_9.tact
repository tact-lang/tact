struct NestedOpt {
    id: Int;
    note: String?;
}

struct Deep {
    opt: NestedOpt?;
    flag: Bool;
}

contract TestContract {
    deepField: Deep;

    init() {
        self.deepField = Deep{ opt: null, flag: false };
    }

    receive() {
        self.deepField = Deep{
            opt: NestedOpt{ id: 1, note: "hi" },
            flag: true
        };
    }
}