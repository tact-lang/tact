contract StringTest {
    receive() {
        let hexString: String = "Hex code: \x41 \x42 \x43";
        dump(hexString);
    }
}