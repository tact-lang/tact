// optional nested struct in param list
struct InnerOpt {
    x: Int;
    y: Bool;
}

contract Test(
    iopt: InnerOpt?,
    flag: Bool?,
) {}