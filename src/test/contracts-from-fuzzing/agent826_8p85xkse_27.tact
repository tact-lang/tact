struct Profile {
    age: Int?;
    name: String;
}

contract ParamOpt(
    owner: Address,
    prof: Profile,
    count: Int
) {}
