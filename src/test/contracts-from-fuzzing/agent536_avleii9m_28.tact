struct Profile {
    name: String;
    age: Int?;
}

contract OptParamStruct(
    profile: Profile?,
) {}