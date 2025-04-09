struct NestedStrings {
    title: String;
    sub: SubString;
}

struct SubString {
    description: String;
    note: String;
}

contract StringNest {
    info: NestedStrings;

    init() {
        self.info = NestedStrings{
            title: "Top",
            sub: SubString{
                description: "Sub",
                note: "Note"
            }
        };
    }
}
