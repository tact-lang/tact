// contract parameter style with multiple types including nested struct
struct Profile { id: Int; name: String; active: Bool; }

contract User(
    userId: Int,
    profile: Profile,
    nickname: String,
    flag: Bool
) {
    receive() {}
}