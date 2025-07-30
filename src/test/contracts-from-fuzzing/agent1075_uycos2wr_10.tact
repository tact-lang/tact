contract StringFieldsContract {
    str1: String = "abc";
    str2: String = "def";
    sopt: String? = null;

    init() {
        self.sopt = "hi";
    }
}