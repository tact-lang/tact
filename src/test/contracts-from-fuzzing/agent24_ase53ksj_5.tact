contract Dummy {}

contract TestHasSameBasechain {
    // This function creates the initial state for Dummy contract and checks if it has the same basechain address as the sender.
    fun testHas() : Bool {
        let init_state = initOf Dummy();
        return init_state.hasSameBasechainAddress(sender());
    }
}
