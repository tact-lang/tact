/* Test I: Valid usage of discard wildcard in receiver parameter with message type */

message UniverseCalls {}

contract TestI {
    receive(_: UniverseCalls) {
        // Valid use of wildcard for discarding the receiver parameter
    }
}
