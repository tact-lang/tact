struct WithString {
    name: String;
    data: Int;
    flag: Bool?;
}

contract WithDef {
    info: WithString = WithString { name: "abc", data: 5, flag: null };
}
