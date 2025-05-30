// edge case with optional struct contract param wrapping optional primitive
struct SOpt {
    val: Int?;
}
contract OptStructParam(
    s: SOpt?
) {}