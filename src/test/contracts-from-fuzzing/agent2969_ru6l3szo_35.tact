struct Profile {
    name: String = "anon";
    active: Bool = false;
    score: Int = 0;
}

contract Test {
    profile: Profile = Profile{};
}