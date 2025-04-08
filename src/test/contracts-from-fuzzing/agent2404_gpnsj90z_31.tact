// Trying contract params using nested struct
struct InnerParams {
    a: Int;
    b: Bool;
}

contract ParamWithStruct(
    ip: InnerParams
) {}