contract TestOptional {
    receive() {
        let x: Int? = null; // optional integer initialized with null
        if (x != null) {
            let y: Int = x!!; // safe unwrapping when not null
        }
    }
}