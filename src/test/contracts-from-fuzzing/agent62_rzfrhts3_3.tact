contract StringsTest {
    fun test() {
        let str1: String = "Hello, ";
        let str2: String = "world!";
        let concatenated: StringBuilder = beginString();
        concatenated.append(str1);
        concatenated.append(str2);

        // Using dump instead of assert to print the result
        dump(concatenated.toString());
    }
}