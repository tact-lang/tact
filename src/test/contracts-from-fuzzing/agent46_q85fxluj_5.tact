contract TestUnaryMinus {
    receive() {
         dump(-5);
         dump(-(-1));
    }
}
