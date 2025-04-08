struct SOpt {
    x: Int?;
    y: Bool?;
}

struct NestedOptionalContainer {
    sopt: SOpt?;
    s: String?;
}

contract Test30 {
    val: NestedOptionalContainer;

    init() {
        self.val = NestedOptionalContainer{
            sopt: null,
            s: null,
        };
    }

    receive() {}
}