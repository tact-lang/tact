contract StringsTest {
    fun test() {
        let str1: String = "Hello, ";
        let str2: String = "world!";
        let concatenated: StringBuilder = beginString();
        concatenated.append(str1);
        concatenated.append(str2);

        // Using require for assertion checks
        require(concatenated.toString() == "Hello, world!", "Strings are not equal!");
    }
}