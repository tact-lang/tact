// 1. Valid Usage: Wildcard as a receiver parameter
// Based on documentation [docs_book_receive.md ], using '_' in a receiver parameter discards the unused message value.

message(42) UniverseCalls {}

contract TestValidReceiver {
    receive(_: UniverseCalls) {
        // Valid: '_' used to discard the message value
    }
}
