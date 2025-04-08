struct StringNested {
    nested: InnerString;
}

struct InnerString {
    nestedAgain: InnerMostString;
}

struct InnerMostString {
    message: String;
}

contract NestedStrings {
    chain: StringNested;
    init(){
        self.chain = StringNested{
            nested: InnerString{
                nestedAgain: InnerMostString{
                    message: "hello"
                }
            }
        };
    }
}