struct StrNested {
    text: String;
}

struct ContainsStruct {
    nested: StrNested;
}

contract StructString {
    val: ContainsStruct;

    init() {
        self.val = ContainsStruct{ nested: StrNested{ text: "hello" } };
    }
}