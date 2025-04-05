fun testIfValid() {
    if (true) {
       dump(100);
    } else {
       dump(200);
    }
}

contract Test {
    receive() {
       testIfValid();
    }
}
