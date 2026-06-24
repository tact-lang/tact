contract StructOptParam(
    p: MaybeVal
) {}

struct MaybeVal {
    a: Int?;
    b: Bool?;
    c: String?;
}
