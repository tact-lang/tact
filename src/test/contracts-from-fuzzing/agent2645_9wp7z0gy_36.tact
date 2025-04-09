trait T {
    const A: Int = 1;
}

contract C with T {
    override const A: Int = 2;
}
