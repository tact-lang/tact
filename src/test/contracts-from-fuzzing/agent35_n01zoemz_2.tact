contract TestBoolDump {
    // This receiver handles a specific message "boolTest"
    receive("boolTest") {
         // Test dump() on primitive Bool values
         dump(true);
         dump(false);
         cashback(sender());
    }
}
