message BuilderMessage {
    data: Builder;
}

contract TestContract {
    receive(msg: BuilderMessage) {
    }
}