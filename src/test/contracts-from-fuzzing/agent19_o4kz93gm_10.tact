contract TestReturnFixed {
    get fun getAnswer(): Int {
         return 42;
    }
    
    receive() {
         let result: Int = self.getAnswer();
         dump(result);
    }
}
