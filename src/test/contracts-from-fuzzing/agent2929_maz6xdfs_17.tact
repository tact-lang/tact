struct Meta {
    id: Int as uint128;
    flag: Bool = false;
    note: String? = null;
}

contract ParamSerialization(
    info: Meta,
    count: Int as int16,
    active: Bool
) {}