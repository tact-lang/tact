struct InnerMost { a: Int; }

struct MidInner { innerMost: InnerMost; b: Bool; }

struct Outer { mid: MidInner; c: String; }

contract NestedStructsTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid: MidInner{
                innerMost: InnerMost{ a: 1 },
                b: true
            },
            c: "test"
        };
    }
}
