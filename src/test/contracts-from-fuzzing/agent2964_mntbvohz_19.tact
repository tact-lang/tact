struct StrNested {
    text: String;
}

contract StringsInNested {
    nested: StrNested;

    init() {
        self.nested = StrNested{
            text: "lorem ipsum" 
        };
    }
}