contract TestNullDeref {
    receive() {
        // This contract dereferences a null optional using the non-null assertion operator (!!).
        // Expected behavior: the compiler compiles this code, but executing it triggers a runtime error due to null access.
        let opt: Int? = null;
        let x: Int = opt!!;
        dump(x);
    }
}
