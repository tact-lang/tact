// Contract param syntax, with nested struct optionals
struct Sub {
    f: Bool?;
}

contract ParamOpt(
    sub: Sub?,
    number: Int?
) {
}
