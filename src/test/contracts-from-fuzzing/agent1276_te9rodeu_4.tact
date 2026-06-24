struct Sub {
    flag: Bool;
    note: String;
}

struct Main {
    count: Int;
    want: Bool;
    item: Sub;
}

contract NestedOptionalFields {
    data: Main?;

    init() {
        self.data = null;
    }
}