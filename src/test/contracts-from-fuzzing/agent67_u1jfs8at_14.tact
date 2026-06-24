contract TestOptional {
    receive() {
        let a: Int? = null;
        // If a is not null, then add 1 to its non-null asserted value; otherwise, dump 0
        dump(a != null ? a!! + 1 : 0);
    }
}
