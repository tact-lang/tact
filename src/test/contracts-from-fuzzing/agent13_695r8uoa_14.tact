fun getSomeMap(): map<Int, Int> {
    let fizz: map<Int, Int> = emptyMap();
    fizz.set(42, 43);
    return fizz;
}

contract TestContract {
    receive() {
        getSomeMap();
    }
}