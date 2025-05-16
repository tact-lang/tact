/*
  Fuzz Test: Contract Message Receiver Behavior
  ------------------------------------------------------------
  This snippet tests the behavior of message receivers in a Tact contract. We aim to explore:
    - The usage of multiple receive handlers (one with a specific message tag and one fallback receive).
    - The prioritization and correct routing of incoming messages based on their tags.
    - That the contract properly executes the correct receive block when a message matching a given tag is received.

  Although the actual message dispatch is managed externally by the TVM, this snippet is compiled to validate the correct syntax and to simulate the behavior in a controlled setting.

  Note: In a real deployment, messages would be dispatched by external callers. For fuzz-testing purposes, we simply verify that the contract compiles and that the receive handlers are defined as expected.
*/

contract TestReceiver {
    // Constructor
    init() {
        dump("Contract initialized");
    }

    // Receive handler for messages tagged with "test"
    receive("test") {
        dump("Received test message");
    }

    // Fallback receive handler for any message not matched by other handlers
    receive() {
        dump("Fallback receive message");
    }
}

fun main() {
    // The main function in contracts is typically empty, as contract behavior is triggered by messages.
    return;
}
