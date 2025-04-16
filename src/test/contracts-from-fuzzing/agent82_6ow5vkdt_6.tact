contract StringTest {
    receive() {
        let codePointStr: String = "Unicode test: \u{26A1}";
        dump(codePointStr);
    }
}