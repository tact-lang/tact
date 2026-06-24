struct Two { first: Int; second: String }

fun test_destructure_rename(): Int {
    let Two { first: a, second: _ } = Two { first: 300, second: "ignored" };
    return a;
}

fun test_assignment(): Int {
    let x: Int = 10;
    x = 20;
    return x;
}

fun test_optional_assert(): Int {
    let opt: Int? = 999;
    return opt!!;
}
