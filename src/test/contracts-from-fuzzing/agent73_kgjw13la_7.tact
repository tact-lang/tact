fun runtimeFunc(): Int {
    return 100;
}

const BAD: Int = runtimeFunc();

contract TestRuntime {
    receive() {}
}
