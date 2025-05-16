contract Test9 {
    // Receiver with unit return; should compile
    receive(msg: Slice) {
       return;
    }
}
