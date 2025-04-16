// Snippet 1: Valid usage of wildcard in receiver parameter

message CallMsg {}

contract TestValidReceiver {
    // The underscore discards the incoming message value
    receive(_: CallMsg) {
        // Body left empty intentionally
    }
}
