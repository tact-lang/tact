struct Person {
    id: Int;
    nickname: String?;
    note: String?;
}

contract UserData(
    info: Person,
) {
    receive() {
        let _ = self.info;
    }
}