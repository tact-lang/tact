struct OptNest {
    val: Int?;
    child: Child?;
}

struct Child {
    text: String?;
    num: Int;
}

contract Test {
    data: OptNest;

    init() {
        self.data = OptNest{
            val: null,
            child: null
        };
    }
}