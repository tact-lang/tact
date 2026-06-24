message MyMsg {
    a: Int;
}

contract TestUnderscoreTypeReceiver {
    receive(_: MyMsg) {
        // receiver with unused typed message parameter
    }
}
