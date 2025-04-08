struct Deep2 {
    a: Int;
    b: String;
}

struct Mid2 {
    x: Deep2;
    y: Deep2;
}

contract NestedParamContract(
    m: Mid2
) {}