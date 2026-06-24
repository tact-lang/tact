// contract parameter with optional struct
struct PStr {
    a: Int;
    b: String?;
}

contract ParamOptional(
    data: PStr?,
) {}