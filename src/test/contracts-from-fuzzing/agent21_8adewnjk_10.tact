contract TestLetInferred {
    receive() {
         let value = 123;
         dump(value);
    }
}
