contract TestContract {
    receive() {
        let surrogate = "Hello \uD800";
        dump(surrogate);
    }
}