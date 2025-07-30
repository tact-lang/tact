contract TestOptionalString2 {
    receive() {
        let s: String? = null;
        if (s == null) {
            s = "Non-null string assigned";
        }
        s!!;
    }
}
