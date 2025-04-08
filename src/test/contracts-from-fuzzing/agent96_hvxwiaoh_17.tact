struct Payload {
    id: Int;
    flag: Bool?;
}

contract ParamWithNestedOptional(
    owner: Address,
    payload: Payload?,
    note: String,
) {}