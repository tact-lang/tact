// Valid: Wildcard as receiver parameter
message Msg {}

contract Test {
    receive(_: Msg) {
        // Valid use: underscore as discarded parameter in receiver
    }
}
