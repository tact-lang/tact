fun testDoUntil(): Int {
    let i = 0;
    do {
        i = i + 1;
    } until (false);
    return i;
}

contract TestDoUntil {
    receive() {
        let result = testDoUntil();
        dump(result); // Expected output: 1
        cashback(sender());
    }
}
