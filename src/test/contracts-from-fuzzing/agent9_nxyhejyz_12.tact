contract TestStrings {
    receive() {
        let hello = "Hello";
        let world = "World";
        if (hello == world) {
            throw(99);
        }
    }
}