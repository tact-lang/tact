struct ComposeOptional {
    data: Nested1?;
}

struct Nested1 {
    value: Int;
}

contract ComposeOptionalHolder {
    val: ComposeOptional;

    init() {
        self.val = ComposeOptional{
            data: null
        };
    }
}
