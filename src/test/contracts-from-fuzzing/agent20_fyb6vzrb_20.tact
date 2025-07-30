struct Pair { first: Int; second: Int }

contract TestGetterLoop {
    get fun test(): Pair {
        repeat (3) {
            if (true) { 
                return Pair { first: 1, second: 2 };
            }
        }
        return Pair { first: 3, second: 4 };
    }
}
