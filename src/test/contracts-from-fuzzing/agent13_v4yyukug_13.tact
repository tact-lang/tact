contract TestSerializationMap {
    // A map where both key and value are serialized as 8-bit unsigned integers
    m: map<Int as uint8, Int as uint8> = emptyMap();

    receive() {
         // Setting a key-value pair
         self.m.set(1, 250);
         
         // Getting the value back
         let v: Int = self.m.get(1)!!;
         dump(v); // expected output: 250
    }
}
