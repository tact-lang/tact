// Contract parameters with nested struct
struct Embedded {
    a: Int;
    b: Bool?;
}

contract ParamNested(
    e: Embedded
) {}