struct Profile {
    id: Int;
    nickname: String?;
}

contract OptionalStructField {
    userProfile: Profile? = null;

    receive() {
        self.userProfile = Profile{ id: 1, nickname: null };
    }
}