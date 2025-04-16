struct NestedOpt {
    inner: LevelOpt?;
}

struct LevelOpt {
    number: Int?;
    text: String?;
}

contract TestNestedOpt {
    val: NestedOpt;

    init() {
        self.val = NestedOpt{
            inner: LevelOpt{
                number: null,
                text: null
            }
        };
    }
}