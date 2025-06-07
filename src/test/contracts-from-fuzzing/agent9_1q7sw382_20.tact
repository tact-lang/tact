contract TernaryGetter {
    receive() {}
    
    get fun choose(val: Bool): Int {
        return val ? 1 : 0;
    }
}
