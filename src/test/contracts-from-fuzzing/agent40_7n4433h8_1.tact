contract TestGetter {
    foo: Int;
    
    init() {
        self.foo = 10;
    }

    // getter function that only reads state variable
    get fun getFoo(): Int {
        return self.foo;
    }
}

// A main function to trigger contract deployment (if needed)
