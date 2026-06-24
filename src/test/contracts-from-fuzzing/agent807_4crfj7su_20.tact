// contract with deep nested and optional fields combos in parameters
struct Leaf {
    foo: Int;
    bar: Int?;
}

struct InnerParamStruct {
    a: Leaf;
    b: Leaf?;
    c: String;
}

contract DeepParamContract(
    root: InnerParamStruct?,
    flag: Bool?,
) {
    receive() {}
}