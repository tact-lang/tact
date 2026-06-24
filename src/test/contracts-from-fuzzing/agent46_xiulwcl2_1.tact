contract Test {
    counter: Int;

    init() {
       self.counter = 1;
    }

    // Getter function that attempts to modify a state variable
    get fun modifyCounter(): Int {
       self.counter = self.counter + 1; // modification in getter
       return self.counter;
    }
}
