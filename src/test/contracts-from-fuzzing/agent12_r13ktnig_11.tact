contract TestContract {
    receive() {
        // Testing dump() with an optional Int. Optional values are allowed.
        // Using 'Int?' since dump() supports optionals.
        let opt: Int? = 123;
        dump(opt);
    }
}
