struct EvenDeeper {
    y: Int;
}

struct WithInnerOpt {
    deep: EvenDeeper?;
    j: Int;
}

contract InnerOptionalTest {
    val: WithInnerOpt;

    init() {
        self.val = WithInnerOpt{
            deep: null,
            j: 12,
        };
    }
}