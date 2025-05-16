fun give42(): Int { 
    return 42; 
}

contract TestReturn {
    receive() {
        dump(give42());
    }
}
