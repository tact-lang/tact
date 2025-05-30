struct DeepFields {
    txt: String?;
    flag: Bool?;
    fixed: Int;
}

contract PersistDeepFields {
    val: DeepFields = DeepFields{
        txt: null,
        flag: true,
        fixed: 999,
    };
}
