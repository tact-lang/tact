// Valid usage: receiver parameter wildcard as Slice (already confirmed)
contract ReceiverValidSlice {
    receive (_: Slice) {}
}
