/* Test 17: Valid destructuring of a message with a wildcard field
   Define a message type with two fields, discard one field using wildcard in the destructuring pattern.
*/

message Msg { a: Int; b: Int; }

contract Test {
    // receive function that accepts a Msg, destructures it, discarding field 'b'
    receive(msg: Msg) {
        let Msg { a, b: _ } = msg;
        dump(a);
    }
}
