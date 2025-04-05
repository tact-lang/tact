fun convertToStr(i: Int): String {
    return i.toString();
}

contract FunctionCallTest {
    receive() {
        let s: String = convertToStr(100);
    }
}
