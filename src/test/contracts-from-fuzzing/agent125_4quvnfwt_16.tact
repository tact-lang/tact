message MyMsg { value: Int; }

contract Test {
    // Using underscore as parameter name for a typed message receiver
    receive(_ : MyMsg) { 
        // parameter discarded
    }
}
