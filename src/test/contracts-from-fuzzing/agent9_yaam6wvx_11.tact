struct Example {
    field: Int;
}

fun main() : Int {
    let e = Example{ field: 5 };
    e.field = 10; // Trying to mutate an immutable struct field
    return e.field;
}
