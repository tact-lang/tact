struct Pair {
    first: Int;
    second: Int;
}

contract GetterReturnTest {
    // Getter using a struct to return a tuple-like value
    get fun tupleGetter(flag: Bool): Pair {
        if (flag) {
            return Pair { first: 1, second: 2 };
        } else {
            return Pair { first: 3, second: 4 };
        }
    }
    
    receive() {}
}
