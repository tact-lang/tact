struct Profile {
    bio: String = "none";
}

struct Person {
    name: String = "anon";
    profile: Profile?; // default null
}

contract Test {
    p: Person = Person{};

    receive() {
        if (self.p.profile != null) {
            let _ = self.p.profile!!.bio;
        }
    }
}