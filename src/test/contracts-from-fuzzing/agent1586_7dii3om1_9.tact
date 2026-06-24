struct Profile {
    username: String;
    bio: String?;
}

contract TestContract {
    profile: Profile? = null;

    receive() {}
}