struct MixedNulls {
    foo: Int;
    bar: Int?;
    baz: Bool;
    qux: String?;
}

contract MixedNullStructField {
    state: MixedNulls = MixedNulls{ foo: 1, bar: null, baz: true, qux: null };

    init() {
        self.state = MixedNulls{ foo:2, bar:3, baz:false, qux:"bye" };
    }
}