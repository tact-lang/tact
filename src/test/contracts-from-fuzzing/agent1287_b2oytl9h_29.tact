struct Contact {
    email: String? = null;
    phone: String? = null;
    country: String = "Noland";
}

struct UserProfile {
    age: Int = 18;
    name: String = "Anonymous";
    contact: Contact? = null;
}

contract RichStructMixedDefaults {
    profile: UserProfile = UserProfile{};
}