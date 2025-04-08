// nested optional in nested struct
struct Bottom {
    x: Int?;
}

struct Middle {
    bot: Bottom?;
    word: String;
}

contract NestedOptionalChain {
    val: Middle?;
    init() {
        self.val = null;
    }
}