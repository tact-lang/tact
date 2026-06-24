contract TestOptionals {
    receive() {
        let opt: Int? = 42;
        let unwrapped: Int = opt!!;
        let result: Int = (opt != null) ? opt!! + 10 : 0;
    }
}
