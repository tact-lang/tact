contract TestReceiverReturn {
    // Receiver that uses an empty return statement
    receive() { 
        return;
    }
}

fun main() {
    dump(0);
}
