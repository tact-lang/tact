struct UserInfo {
    name: String;
    age: Int?;
}

contract OptionalParamContract(
    maybeUser: UserInfo?,
) {
    receive() {}
}