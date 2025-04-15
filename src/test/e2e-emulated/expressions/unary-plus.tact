contract TestContract {
    receive() {}

    get fun foo(): Int {
        let two = 2;
        return +two;
    }
}
