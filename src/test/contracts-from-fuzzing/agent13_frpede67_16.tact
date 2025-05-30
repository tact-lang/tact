// test optional struct field inside contract params
struct MaybeData { foo: Int; bar: Bool; }

contract TestContract(
    d: MaybeData?,
    x: Int,
    s: String?
) {}