struct SubProfile {
    email: String?;
    phone: String?;
}

struct UserProfile {
    name: String;
    age: Int as uint8;
    bio: String?;
    contact: SubProfile?;
}

contract UsersContract(
    admin: UserProfile,
    guest: UserProfile?
) {
    receive() {
        require(self.admin.age >= 0, "ok");
    }
}