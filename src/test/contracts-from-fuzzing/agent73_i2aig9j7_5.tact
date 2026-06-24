contract StringTest {
    receive() {
        let s: String = "This string contains a form feed:\f and a vertical tab:\v.";
        dump(s);
    }
}