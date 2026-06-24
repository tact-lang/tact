struct Details {
    nickname: String?;
    email: String?;
}

contract ParamTest(
    id: Int,
    info: Details?,
) {
    receive() {
        dump(0);
    }
}