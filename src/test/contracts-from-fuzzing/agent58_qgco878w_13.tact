struct SomeStruct {
    x: Int;
    y: Bool;
}

contract StructOptTest {
    maybe: SomeStruct?;

    init() {
        self.maybe = null;
    }
}