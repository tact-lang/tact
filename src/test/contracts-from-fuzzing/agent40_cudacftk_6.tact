struct Details {
    name: String;
    email: String?;
}

contract Test(
    details: Details?,
    alias: String?,
) {
    receive() {}
}