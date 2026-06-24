contract TestIntDump {
    // This receiver handles a specific message "intTest"
    receive("intTest") {
         // Test dump() on a primitive Int value
         dump(42);
         // Complete execution by returning any remaining value back to the sender
         cashback(sender());
    }
}
