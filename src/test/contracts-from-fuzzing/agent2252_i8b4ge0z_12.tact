struct InnerX { foo: Int }
struct MiddleY { bar: InnerX }
struct OuterZ { baz: MiddleY }

contract NestedStructLevels {
    payload: OuterZ;
    init() {
        self.payload = OuterZ{ baz: MiddleY{ bar: InnerX{ foo: 123 } } };
    }
}