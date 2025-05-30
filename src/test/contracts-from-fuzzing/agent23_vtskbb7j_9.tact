contract TestOptional {
    receive() {
         let opt: Int? = 42;
         let nonNull = opt!!; // testing non-null assertion on an optional
    }
}
