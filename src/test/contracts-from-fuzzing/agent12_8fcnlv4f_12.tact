contract TestArithmeticConst() {
    // Define a constant 'comp' computed at compile-time
    const comp: Int = (ton("1") - ton("1")) + (ton("0.5") + ton("0.5"));

    // Getter function returns the value of the computed constant
    get fun getComp(): Int {
        return self.comp;
    }

    // Dummy receiver to ensure complete compilation
    receive() {}
}
