contract Test {
    receive("message") {
         dump(1);
    }
    
    receive(msg: String) {
         dump(2);
    }
    
    receive(msg: Slice) {
         dump(3);
    }
}
