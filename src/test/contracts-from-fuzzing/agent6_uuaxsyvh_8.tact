contract TestOptional4 {
    receive() {
        let x: Int? = null;
        if (x != null) {
            let y = x; // Check if type is recognized as Int in this branch
            dump(y);
        }
    }
}