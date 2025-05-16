struct Profile {
    bio: String = "default";
}

struct Person {
    name: String;
    profile: Profile?;
}

contract Test(
    person: Person,
) {
    receive() {
        if (self.person.profile != null) {
            let _ = self.person.profile!!.bio;
        }
    }
}