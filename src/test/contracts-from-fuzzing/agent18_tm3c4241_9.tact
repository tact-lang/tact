struct Pair { first: Int; second: Int }

contract GetterStruct {
    get fun getPair() : Pair {
        return Pair { first: 3, second: 4 };
    }

    receive() {}
}
