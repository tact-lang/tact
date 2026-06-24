struct NestedOptionals {
    first: Int?;
    second: Bool?;
    third: Cell?;
}

struct WrapOptionals {
    nested: NestedOptionals?;
}

contract NestedOptionalWrapper {
    val: WrapOptionals;

    init() {
        self.val = WrapOptionals{
            nested: NestedOptionals{
                first: null,
                second: true,
                third: null
            }
        };
    }
}