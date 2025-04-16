contract TestOptionalValue {
    receive() {
        // Testing dump() with an optional value containing an integer using let assignment
        let opt: Int? = 456;
        dump(opt);
    }
}
