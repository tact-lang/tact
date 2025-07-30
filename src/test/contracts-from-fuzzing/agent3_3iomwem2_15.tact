///////////////////////////////////////////////////////////////
// Snippet A: Destructuring Assignment Test
///////////////////////////////////////////////////////////////

struct Pair {
    first: Int;
    second: String;
}

struct User {
    id: Int;
    name: String;
}

fun destructuring_test() : Pair {
    let User { id, name } = User { id: 42, name: "Alice" };
    return Pair { first: id, second: name };
}
