struct InnerOpt {
    v: Int?;
    b: Bool?;
}

contract TestContract(
    inner: InnerOpt?,
    number: Int,
    flag: Bool,
) {}