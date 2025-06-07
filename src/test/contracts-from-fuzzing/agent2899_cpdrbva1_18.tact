// deeply nested param structs
struct InnerParam { x: Int; }
struct MiddleParam { inner: InnerParam; }

contract ParamsNested(
    nested: MiddleParam,
) {}
