// contract with contract parameters syntax and nested struct type
struct Info {
    a: Int;
    b: Bool;
    c: String?;
}

contract ParamContract(
    info: Info
) {}