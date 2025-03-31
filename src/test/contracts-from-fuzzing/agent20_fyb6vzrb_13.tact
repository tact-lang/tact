struct Pair { first: Int; second: Int }

contract TestGetter {
    get fun test(): Pair {
        if (1 < 2) {
            { 
                return Pair { first: 10, second: 20 };
            }
        } else {
            { 
                return Pair { first: 30, second: 40 };
            }
        }
    }
}
