contract TestChainCalls {
    receive() {
        dump(42.toString());
        dump("Tact is awesome!".asComment());
    }
}
