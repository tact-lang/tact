contract TestContract {
    receive() {
        // Testing string concatenation using StringBuilder.concat
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello");
        sb = sb.concat(", ");
        sb = sb.concat("Tact");
        let s: String = sb.toString();
        if (s == "Hello, Tact") {
            dump("ok");
        } else {
            dump("fail");
        }
    }
}
