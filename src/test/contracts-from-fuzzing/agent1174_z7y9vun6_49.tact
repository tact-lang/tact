// Deep optional inside nested struct with default null
struct DeepOpt {
    inner: Int?;
}

struct OuterOptWrap {
    val: DeepOpt?;
}

contract DeepOptNull {
    field: OuterOptWrap = OuterOptWrap{ val: null };
}