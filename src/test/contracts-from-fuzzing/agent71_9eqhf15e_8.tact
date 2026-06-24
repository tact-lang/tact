const HEXSLICE: Slice = rawSlice("4a");

contract TestSlice {
    receive() {
        let value: Int = HEXSLICE.loadUint(8);
    }
}
