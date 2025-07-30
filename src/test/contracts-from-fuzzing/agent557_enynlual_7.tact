struct NestedStr {
    text: String;
    number: Int;
}

struct HasNestedOptional {
    data: NestedStr?;
    flag: Bool;
}

contract TestContract {
    field: HasNestedOptional;

    init() {
        self.field = HasNestedOptional{
            data: null,
            flag: false
        };
    }
}