contract TestLet {
    receive() {
        let x = 5; // testing let with type inference
        dump(x);
    }
}
