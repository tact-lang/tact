contract StringTest {
    receive() {
        let escapeString: String = "This is a string with a newline character:\nNew Line Here";
        dump(escapeString);
    }
}