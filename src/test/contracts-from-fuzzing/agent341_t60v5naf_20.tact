struct AA { a: Int }
struct BB { b: AA }
struct CC { c: BB }

contract NestedDefault {
    val: CC = CC{ c: BB{ b: AA{ a: 10 } } };
}