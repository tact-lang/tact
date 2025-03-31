contract TestPrimitive {
    // minimal receive function to ensure contract is linked
    receive() {}

    // Getter returning a primitive Int value
    get fun getNumber(): Int {
        return 123;
    }
}
