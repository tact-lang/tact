fun ret(): Int { return 42; }

contract TestReturn {
    receive() { dump(ret()); }
}
