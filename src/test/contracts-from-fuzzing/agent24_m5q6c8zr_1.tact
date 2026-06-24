contract TestGetter {
    x: Int;

    init() {
       self.x = 5;
    }

    // Getter that attempts to modify the state variable
    get fun modifyX(): Int {
       self.x = 10;  // attempt to modify state
       return self.x;
    }

    // Getter that just reads the state
    get fun readX(): Int {
       return self.x;
    }
}
