struct SubOptional {
    val: Int?;
}

struct Holder {
    sub: SubOptional?;
}

contract NullOptionalAssignTest {
    data: Holder;

    init() {
        self.data = Holder{
            sub: null
        };
    }

    receive() {}
}