contract TestEmpty {
    state: Int = 0;

    receive() {
         // When an empty internal message arrives, set state to 1.
         self.state = 1;
    }
}