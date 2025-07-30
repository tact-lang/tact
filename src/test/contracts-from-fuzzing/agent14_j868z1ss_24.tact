contract FinalSummary {
    dummy: Int = 0;

    init() {
         self.dummy = 0;
    }

    receive() {
         // This receiver does nothing; it denotes the end of our testing cycle.
    }
}
