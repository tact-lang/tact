fun f(): Int {
    return 123;
}

contract TestReturnValid {
    receive() {
         let x = f();
         dump(x);
    }
}
