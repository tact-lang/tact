contract LongStringStorage {
    greeting: String;

    init() {
        self.greeting = "This is a very very long string used for fuzz testing persistence of long strings in storage, hopefully to test any boundary conditions inside the Tact compiler with regards to string size limitations and serialization behavior.";
    }
}
