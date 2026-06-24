struct SA {
    a: Int;
}
struct SB {
    b: SA;
}

contract DeepStructChainField(
    data: SB,
) {
    receive() {}
}