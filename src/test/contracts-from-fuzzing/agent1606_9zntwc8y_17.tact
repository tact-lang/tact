struct NestedStrings {
    s1: String;
    s2: String;
    optS: String?;
}

struct Wrapper {
    payload: NestedStrings;
    note: String;
    maybeText: String?;
}

contract NestedStringFields {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            payload: NestedStrings{ s1:"x", s2:"y", optS:null },
            note: "abc",
            maybeText: null,
        };
    }

    receive() {
        let d = self.data;
    }
}