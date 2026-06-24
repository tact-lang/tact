contract TestReturnGetterScalar {
    // Getter returning an integer
    get fun getValue(): Int {
         return 42;
    }

    // Regular function returning an integer
    fun getValueFunc(): Int {
         return 42;
    }
}
