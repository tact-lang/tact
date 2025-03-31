struct Person {
    name: String;
}

fun getName() : String {
    let p: Person = Person { name: "Alice" };
    return p.name;
}

contract TestContract {
    receive() {
        getName();
    }
}
