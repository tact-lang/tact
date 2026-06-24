struct EmbeddedOptionals {
    a: Int?;
    nest: NestedInner?;
}

struct NestedInner {
    b: Bool;
    s: String;
}

contract EmbeddedOptionalTest {
    val: EmbeddedOptionals;

    init() {
        self.val = EmbeddedOptionals{
            a: null,
            nest: null
        };
    }
}