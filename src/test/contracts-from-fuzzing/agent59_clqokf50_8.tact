contract TestOptionalValid {
    receive() {
         let a: Int? = 123;
         let b: Int = a!!; // non-null assertion on a non-null value
    }
}
