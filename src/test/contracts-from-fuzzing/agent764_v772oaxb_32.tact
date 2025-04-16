struct Innermost {
    val: Int;
}

struct InnerOpt {
    data: Innermost?;
}

contract InnerOptionalTest {
    value: InnerOpt;

    init() {
        self.value = InnerOpt{
            data: null
        };
    }
}