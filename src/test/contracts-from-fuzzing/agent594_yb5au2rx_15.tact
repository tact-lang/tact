struct NullablePrimitives {
    x: Int?;
    y: Bool?;
    z: String?;
    s: Slice?;
    c: Cell?;
    b: Builder?;
    a: Address?;
}

contract NullablePrimitivesContract {
    data: NullablePrimitives = NullablePrimitives{
        x: null,
        y: null,
        z: null,
        s: null,
        c: null,
        b: null,
        a: null
    };
}