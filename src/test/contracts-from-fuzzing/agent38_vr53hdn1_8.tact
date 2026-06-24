contract TestOptional {
    receive() {
        let a: Int? = 42;
        if (a != null) {
            let b: Int = a!!;
        }
    }
}
