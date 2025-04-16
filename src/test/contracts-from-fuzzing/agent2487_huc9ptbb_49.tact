// A contract with optional structured contract parameter
struct S {
    a: Int;
    b: Bool;
}

contract ParamOpt(
    s: S?,
) {}
