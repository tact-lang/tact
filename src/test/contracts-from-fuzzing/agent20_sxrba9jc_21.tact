/* Test 23: Valid usage of wildcard as a receiver function parameter
   Here we define a message type and use the wildcard in the receive() function to discard its content.
*/

message Msg { value: Int; }

contract Test {
    // The receiver function accepts a Msg, but discards it since its value is not used
    receive(_: Msg) {
        dump(1);
    }
}
