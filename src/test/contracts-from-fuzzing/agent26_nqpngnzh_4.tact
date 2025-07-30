fun getNumber(): Int {
    return 123;
}

contract TestReturn {
    receive() {
         dump(getNumber());
    }
}
