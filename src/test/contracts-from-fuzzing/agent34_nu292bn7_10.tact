struct Person {
    name: String;
}

contract Test {
    // required receive function for contract instantiation
    receive() {}

    // Getter that returns an optional struct value, here returning null
    get fun getPerson() : Person? {
         return null;
    }
}
