struct Meta {
    info: String;
}

struct BigStruct {
    id: Int;
    label: String;
    enabled: Bool;
    desc: String;
    meta: Meta?;
}

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            id: 9,
            label: "Lab",
            enabled: false,
            desc: "Description",
            meta: null
        };
    }
}