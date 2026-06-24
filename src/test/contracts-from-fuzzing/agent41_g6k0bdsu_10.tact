struct Person { name: String; age: Int }

fun getPerson(): Person {
    return Person { name: "Alice", age: 30 };
}

contract TestFieldAccess {
    receive() {
        let person = getPerson();
        dump(person.name);
        dump(person.age + 5);
    }
}
