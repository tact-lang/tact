struct InnerData {
    info: String?;
    num: Int;
}

contract MultiParam(
    owner: Address,
    flag: Bool,
    nested: InnerData,
    maybeVal: Int?,
) {}