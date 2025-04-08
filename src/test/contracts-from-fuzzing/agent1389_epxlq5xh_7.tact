struct NestedOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
}

struct HasNestedOptionals {
    inner: NestedOptionals?;
}

contract OptionalLayers {
    field: HasNestedOptionals;

    init() {
        self.field = HasNestedOptionals{
            inner: NestedOptionals{
                x: null, y: true, s: null
            }
        };
    }
}