struct Medium {
    id: Int;
    flag: Bool;
    label: String;
    note: String;
    bigger: Bigger;
}

struct Bigger {
    status: Bool;
    comment: String;
}

contract StorageTest {
    info: Medium = Medium{
        id: 7,
        flag: true,
        label: "label",
        note: "note",
        bigger: Bigger{
            status: false,
            comment: "comment"
        }
    };
}