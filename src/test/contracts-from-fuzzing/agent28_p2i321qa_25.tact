struct Example { num: Int }

fun getEx(): Example { return Example { num: 42 } }

contract TestDestructuring {
    receive() {
        let Example { num } = getEx();
        dump(num); // Expected output: 42
    }
}
