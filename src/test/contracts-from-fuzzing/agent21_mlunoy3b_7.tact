struct Person { 
    name: String; 
    age: Int 
}

contract TestFieldAccess {
    receive() {
        // Testing field access and nested expressions
        let person: Person = Person { name: "Alice", age: 30 };
        let ageOfPerson: Int = person.age;
        return;
    }
}
