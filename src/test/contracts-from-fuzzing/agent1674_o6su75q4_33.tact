struct Profile {
    age: Int;
    name: String;
}

contract OptionalParam(
    profile: Profile?,
    flag: Bool,
) {}