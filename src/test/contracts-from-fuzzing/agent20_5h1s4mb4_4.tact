contract TestStr {
    // receiver for arbitrary text messages
    receive(str: String) {
        // dummy operation using the message string
        let msg: String = str;
    }
}
