struct OptionalNested {
    val1: Int?;
    val2: String?;
    child: Child?;
}

struct Child {
    flag: Bool;
    text: String;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            val1: null,
            val2: "yo",
            child: Child{
                flag: true,
                text: "hi",
            }
        };
    }
}