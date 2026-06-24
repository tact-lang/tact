contract TestString {
    state: String = "";

    receive(str: String) {
        self.state = str;
    }
}
