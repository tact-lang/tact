// Persistent storage field with large string default
contract LongStringDefault {
    bigstr: String = "This is a long string with many characters 0123456789 abcdefghijklmnopqrstuvwxyz !@#$%^&*()";
    
    init() {
        self.bigstr = "This is a long string with many characters 0123456789 abcdefghijklmnopqrstuvwxyz !@#$%^&*()";
    }
}