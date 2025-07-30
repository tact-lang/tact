// contract parameter with nested struct containing optionals
struct Child {
    x: Int?;
    y: String?;
}

contract ParamNested(
    data: Child,
) {}