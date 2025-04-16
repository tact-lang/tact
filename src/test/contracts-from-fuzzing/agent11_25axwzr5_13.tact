/*
DestructuringValid.snippet

This snippet tests valid destructuring assignment of a struct.
It defines a struct Pair with two fields, then a function that destructures an instance to sum the fields.
Expected result: 30
*/

struct Pair { first: Int; second: Int }

fun sumPair(p: Pair): Int {
    let Pair { first, second } = p;
    return first + second;
}

contract DestructuringValid {
    get fun test(): Int {
        return sumPair(Pair { first: 10, second: 20 });
    }
}
