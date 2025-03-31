contract Test {
    value: Int = 100;
    
    // required receive function for contract instantiation
    receive() {}

    // A getter function returning a primitive value
    get fun getValue() : Int {
         return self.value;
    }
}
