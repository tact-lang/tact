// nested optional persistent vars + constructor params, mixed
struct Child {
    a: Int?;
    b: String?;
}

contract ParamMix(
    x: Int?,
    y: String?,
    kid: Child?,
) {
}
