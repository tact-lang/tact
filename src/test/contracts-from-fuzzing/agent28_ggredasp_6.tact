contract StringEmptyCheck {
    receive() {
        let testStr: String = "";
        if (testStr == "") {
            dump("String is empty");
        } else {
            dump("String is not empty");
        }
    }
}