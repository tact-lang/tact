struct HasEmptyStr {
    name: String = "";
}

contract EmptyStringTest {
    info: HasEmptyStr;

    init() {
        self.info = HasEmptyStr{ name: "" };
    }

    receive() {
        let _ = self.info;
    }
}