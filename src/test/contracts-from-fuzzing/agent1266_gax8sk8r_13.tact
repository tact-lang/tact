struct Info {
    id: Int;
    text: String = "hi";
}

contract ParamMissingDefault(
    meta: Info,
    amount: Int as uint64
) {}