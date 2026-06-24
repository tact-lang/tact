struct Point { x: Int = 0; y: Int?; }
struct Box { a: Point; b: Point?; }

contract NestedParam(
    data: Box,
) {}