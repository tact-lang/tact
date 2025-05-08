contract ParamOptionalTest(
    maybeNum: Int?,
    maybeStr: String?
) {
    receive() {
        let x = self.maybeNum;
        let y = self.maybeStr;
    }
}