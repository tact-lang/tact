struct Box {
    content: Int?;
}

struct OuterBox {
    box: Box?;
}

contract OptionalNestedOptional {
    val: OuterBox;

    init() {
        self.val = OuterBox{
            box: null
        };
    }
}