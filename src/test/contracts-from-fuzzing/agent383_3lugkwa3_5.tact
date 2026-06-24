struct User {
    id: Int;
    name: String;
}

contract StructFieldTest {
    user: User = User{ id: 1, name: "Alice" };
    receive() {}
}