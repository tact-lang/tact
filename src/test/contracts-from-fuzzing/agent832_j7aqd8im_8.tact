struct NestedStrings {
    label: String;
    note: String;
}

struct BigWithStrings {
    title: String;
    desc: String;
    nested: NestedStrings;
}

contract StringHeavy {
    stuff: BigWithStrings = BigWithStrings{
        title:"Title",
        desc: "Description",
        nested: NestedStrings{label: "label", note: "note"}
    };
    receive() {
        let _ = self.stuff.nested.label;
    }
}