contract TestGetterSender {
    receive() {}
    
    // Getter function using sender(), even though it's not expected to be meaningful in a getter
    get fun getSender(): Address {
        return sender();
    }
}
