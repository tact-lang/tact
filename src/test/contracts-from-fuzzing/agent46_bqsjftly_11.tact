extends fun add100(self: Int): Int {
    return self + 100;
}

contract TestShadow {
    get fun run(): Int {
        return 10.add100();
    }
}
