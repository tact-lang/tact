message Msg1 {}

contract TestBinaryReceiver {
    x: Int = 0;
    
    receive(msg: Msg1) {
        self.x = 999;
    }
}
