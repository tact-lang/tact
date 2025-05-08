// Test contract parameter style with an optional nested struct
struct MaybeNest {
    val: Int?;
}

contract OptionalParam(
    nest: MaybeNest?,
) {
}