struct S1 { foo: Int; }
struct S2 { bar: S1; }

contract NullStructField {
    data: S2?;

    init() {
        self.data = null;
    }
}