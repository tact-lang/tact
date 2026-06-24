// Edge: persistent struct inside param, nested optionals
struct S {
    x: Int?;
    y: Bool?;
}
contract A(
    val: S?
) {}