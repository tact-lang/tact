contract StringTest {
    receive() {
        let str: String = "This contains a tab\tcharacter.";
        dump(str);
    }
}