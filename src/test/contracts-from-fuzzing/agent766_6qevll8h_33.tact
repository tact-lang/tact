// multiple optional composite types in params
struct Data1 { a: Int; }
struct Data2 { b: Bool; }

contract ParamTest(
    x: Data1?,
    y: Data2?
) {}