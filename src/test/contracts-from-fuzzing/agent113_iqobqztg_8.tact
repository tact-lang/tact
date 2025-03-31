message MyMessage1 {
    value: Int;
}

contract TestUnderscoreReceiver {
    // receiver using underscore to discard message parameter
    receive(_: MyMessage1) {
    }
}
