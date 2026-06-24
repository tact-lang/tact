struct Pair { first: Int; second: Int }

contract TestDestructuringIgnore {
    fun test(): Int {
        let p: Pair = Pair{ first: 10, second: 20 };
        let Pair { first, second: _ } = p;
        return first;
    }
}
