contract BoundariesValid {
    // Define a field 'a' with signed integer of 257 bits, which should be allowed (range: -2^(256) to 2^(256)-1)
    a: Int as int257 = 42;
    
    receive() {
       cashback(sender());
    }
}
