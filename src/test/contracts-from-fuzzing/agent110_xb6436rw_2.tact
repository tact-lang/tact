contract TestText {
    state: Int = 0;

    receive("inc") {
         // This receiver should be called when the message comment matches "inc"
         self.state += 1;
    }
}