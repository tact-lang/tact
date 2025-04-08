// nullable struct instance (struct optional)
struct SOpt {
    foo: Int;
}

contract NullableStructInstance {
    data: SOpt?;
    init() {
        self.data = null;
    }
}