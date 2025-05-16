// non-recursive nested optional struct param
struct DeepNestOpt2 {
    s: String;
    inner: Inner2?;
}

struct Inner2 {
    x: Int;
    y: String?;
}

contract ParamDeepOptional(
    nest: DeepNestOpt2?,
    flag: Bool,
) {}