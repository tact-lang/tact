contract StringTest {
    receive() {
        let escapeString: String = "This is a string with a tab character:\tTab Here";
        dump(escapeString);
    }
}