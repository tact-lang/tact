struct InnerMost { x: Int; y: Int }
struct NestedMid { pt: InnerMost; flag: Bool? }
struct OuterMost { nested: NestedMid; label: String }

contract ComplexNested {
    foo: OuterMost;

    init() {
        self.foo = OuterMost{
            nested: NestedMid{
                pt: InnerMost{ x: 7, y: 11 },
                flag: false
            },
            label: "hello"
        };
    }
}