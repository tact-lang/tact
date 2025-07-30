// Nested optional fields with top level optional struct in param
struct Inner {
    x: Int?;
    y: Bool?;
}

contract ParamsNested(
    param1: Inner?
) {}