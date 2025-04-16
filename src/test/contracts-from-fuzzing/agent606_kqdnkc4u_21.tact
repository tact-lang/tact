struct User {
    name: String = "anon";
    active: Bool = true;
}

struct Wrapper {
    u: User?;
}

contract Test {
    data: Wrapper = Wrapper{ u: User{} };
}