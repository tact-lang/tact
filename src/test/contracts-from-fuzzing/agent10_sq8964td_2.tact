struct Params {
    name: String = "TactLang";
    age: Int?;
}

fun test() {
    let p1 = Params { name: "Alice", age: 30 };
    let p2 = Params { name: "Bob" };
}
