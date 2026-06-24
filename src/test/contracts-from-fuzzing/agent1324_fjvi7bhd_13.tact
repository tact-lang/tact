struct Profile {
    name: String?;
    score: Int?;
}

contract OptStructImplicitNull {
    prof: Profile?;
    init() {}
}