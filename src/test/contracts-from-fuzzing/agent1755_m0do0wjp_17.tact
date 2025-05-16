struct Mix {
    i: Int;
    j: Int?;
    flag: Bool;
    choice: Bool?;
    who: Address;
    maybeWho: Address?;
    text: String;
    maybeText: String?;
}

contract ParamTest(
    state: Mix,
) {}
