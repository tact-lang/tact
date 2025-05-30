// Large string constants in contract persistent storage
contract TestContract {
    s1: String = "a very very very very long string constant with many many characters to test serialization and persistent storage handling and edge case behaviors inside the Tact compiler";

    init() {
        self.s1 = "changed string with other very very very long text to test overwriting previously stored large strings in persistent storage";
    }
}
