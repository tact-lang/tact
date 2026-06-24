contract OptionalParamContract(
    owner: Address,
    admin: Address?,
    active: Bool,
    nickname: String?,
    age: Int?,
    score: Int as uint32,
) {}