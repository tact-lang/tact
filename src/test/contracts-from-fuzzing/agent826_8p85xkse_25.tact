struct P {
    id: Int;
    text: String;
}

contract ParamContract(
    owner: Address,
    info: P,
    flag: Bool,
    num: Int
) {
    // no init() here
}
