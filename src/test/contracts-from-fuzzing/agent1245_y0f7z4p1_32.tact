struct S1 { foo: Int }
struct S2 { bar: S1? }

contract TopWithOptional {
    nested: S2?;

    init() {
        self.nested = null;
    }
}
