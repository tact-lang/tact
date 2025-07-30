contract TestDebugOptionalFixed {
    receive() {
         let opt1: Int? = 42;
         dump(opt1);
         let opt2: Int? = null;
         dump(opt2);
    }
}
