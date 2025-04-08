struct DeepNested {
    inner: InnerLevel;
}

struct InnerLevel {
    foo: Int;
    bar: DeeperLevel?;
}

struct DeeperLevel {
    baz: Int;
    qux: Int?;
}

contract TestContract {
    state: DeepNested = DeepNested{ inner: InnerLevel{ foo: 1, bar: DeeperLevel{ baz: 2, qux: 3 } } };
}