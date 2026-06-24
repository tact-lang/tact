struct Profile {
    age: Int as uint8;
    nickname: String?;
}

contract TestContract(
    user: Profile,
) {
    receive() {}
}