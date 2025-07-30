struct NestedStructA { a: Int; }
struct NestedStructB { b: Bool; nsA: NestedStructA; }
struct NestedStructC { c: String; nsB: NestedStructB; }
struct NestedStructD { d: Address; nsC: NestedStructC; }

contract TestContract {
    nested: NestedStructD;
    init() {
        self.nested = NestedStructD{
            d: myAddress(),
            nsC: NestedStructC{
                c: "foo",
                nsB: NestedStructB{
                    b: true,
                    nsA: NestedStructA{
                        a: 999
                    }
                }
            }
        };
    }
}