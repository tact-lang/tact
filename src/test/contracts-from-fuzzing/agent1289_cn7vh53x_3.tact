struct Inner { foo: Int?; bar: Bool?; }

struct Outer { a: Int; nested: Inner; }

contract NestedOptionalTest {
    data: Outer;

    init() {
        self.data = Outer{a: 5, nested: Inner{foo: null, bar: true}};
    }
}
