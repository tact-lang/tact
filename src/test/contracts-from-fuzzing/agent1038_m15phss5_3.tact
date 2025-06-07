struct OptionHolder {
    val: Int?;
    flag: Bool?;
}

contract OptionalFields {
    hold: OptionHolder = OptionHolder{ val: null, flag: null };
    init() {}
}