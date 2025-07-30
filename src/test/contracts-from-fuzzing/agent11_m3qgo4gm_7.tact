struct Person {
    name: String = "Alice";
    age: Int?;          // optional, defaults to null
    city: String;       // required field
}

fun testPerson(): String {
    // Providing only the required field; 'age' will be null, and 'name' defaults to "Alice"
    let p: Person = Person { city: "Wonderland" };
    return p.name;
}

fun main() {
    testPerson();
}
