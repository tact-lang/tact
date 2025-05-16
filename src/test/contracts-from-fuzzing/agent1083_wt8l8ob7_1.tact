struct DeepNested {
    inner: OptionalHolder;
}

struct OptionalHolder {
    maybePoint: Point?;
}

struct Point {
    x: Int;
    y: Int;
}

contract NestOptHolder {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: OptionalHolder{
                maybePoint: null,
            },
        };
    }
}