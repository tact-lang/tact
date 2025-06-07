struct OptionalStruct { foo: Int?; bar: Bool?; nested: NestedOpt?; }
struct NestedOpt { baz: Int?; qux: Bool?; }

contract OptTest {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{
            foo: null,
            bar: true,
            nested: NestedOpt{
                baz: 42,
                qux: null
            }
        };
    }
}