contract TestOptionals {
    receive() {
        let a: Int? = null;
        let b: Int? = 50;
        let c: Int = b!!;
        if (a != null) {
            let d: Int = a!! + c;
        }
    }
}
