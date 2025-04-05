contract TestContract {
    receive() {
        let msg = context();
        let value: Int = msg.value;
    }
}