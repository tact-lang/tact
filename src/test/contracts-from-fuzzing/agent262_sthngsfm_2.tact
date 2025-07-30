fun compile_time_return(x: Int): Int {
    if (x < 5) {
        return 42;
    } else {
        return 99;
    }
}

contract Test {
    a: Int = compile_time_return(3);
    b: Int = compile_time_return(7);
}
