struct Person {
    name: String;
    age: Int;
}

contract TestDestructuringAssignment {
    receive() {
        // Destructuring assignment from an instantiation of a struct
        let Person { name, age } = Person { name: "Bob", age: 25 };
        dump(name);
        dump(age);
    }
}
