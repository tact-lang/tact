struct NestedOptional {
    innerOpt: Int?;
    flag: Bool;
    text: String?;
}

contract OptionalStructStorage {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            innerOpt: null,
            flag: true,
            text: null,
        };
    }

    receive() {
        let v = self.val;
    }
}