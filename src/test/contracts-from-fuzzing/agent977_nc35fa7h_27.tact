// contract param with optional primitive fields with serialization and nested struct
struct Bits {
    foo: Int as int8;
    bar: Bool;
}
contract ParamMix(
    count: Int? as uint64,
    phrase: String?,
    info: Bits
) {}
