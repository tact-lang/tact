struct One { number: Int; }

contract TestStructValid() {
    receive() {
        let o: One = One{ number: 50 };
        dump(o.number); // Expected output: 50
    }
}
