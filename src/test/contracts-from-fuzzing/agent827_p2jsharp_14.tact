contract OptStringSingle {
    nickname: String? = null;

    receive() {
        self.nickname = "renamed";
    }
}