message(1) One {}

contract Example {
    // Binary receiver: matches message of type One
    receive(_: One) {
        // No operation for the binary message
    }

    // Text receiver: matches message by literal text 'one'
    receive("one") {
        // No operation for the text message
    }
}
