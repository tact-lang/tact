contract TestNullLiteral {
    receive() {
        let a: Int? = null;
        if (a != null) {
            let b: Int = a!!;
        }
    }
}
