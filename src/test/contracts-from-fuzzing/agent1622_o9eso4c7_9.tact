struct Profile {
    nickname: String;
    details: Details?;
}

struct Details {
    age: Int;
    country: String;
}

contract NestedOptionalStorage {
    user: Profile?;
}