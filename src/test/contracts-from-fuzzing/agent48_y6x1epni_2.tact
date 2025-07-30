contract StringTest {
    fun test(): Bool {
        let result: String = "Hello,\nWorld!";
        return result == "Hello,\nWorld!";
    }
}