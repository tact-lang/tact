contract HelloWorld {
    var: Int = 5;

    // Getter function should not modify state; attempting to modify state in a getter should trigger a compilation error.
    get fun getVar(): Int {
        self.var = 10; // This should not be allowed
        return self.var;
    }
}
