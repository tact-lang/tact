struct ManyNestedOptional {
    inn: Inner?;
}

struct Inner {
    deep: Int?;
}

contract OptionalDeep {
    val: ManyNestedOptional;

    init() {
        self.val = ManyNestedOptional{
            inn: Inner{ deep: null }
        };
    }
}