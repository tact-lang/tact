struct Details {
    info: String?;
    flag: Bool;
}

struct Description {
    number: Int;
    details: Details?;
}

contract NestedOptStructFields {
    data: Description?;

    init() {
        self.data = null;
    }
}