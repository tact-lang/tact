contract Test {
    receive() {
         // Testing optional non-null assertion on a non-null Int?
         let opt: Int? = 42;
         dump(opt!!);
    }
}
