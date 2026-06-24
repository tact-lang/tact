struct StringStruct {
    text: String;
    optText: String?;
}

struct NestedStringStruct {
    data: StringStruct;
    optData: StringStruct?;
}

contract StringStorage {
    info: NestedStringStruct;

    init() {
        self.info = NestedStringStruct {
            data: StringStruct {
                text: "Hello",
                optText: null,
            },
            optData: null,
        };
    }
}