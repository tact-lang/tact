fun testRepeatValid() {
    let counter: Int = 0;
    repeat (5) {
        counter += 1;
    }
    dump(counter); // expected to dump 5
}

contract Test {
    receive() {
       testRepeatValid();
    }
}
