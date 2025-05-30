message MyMsg { value: Int }

contract ValidReceive {
    receive (_: MyMsg) {
        // valid usage: discard parameter value
    }
}
