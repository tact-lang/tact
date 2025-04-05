struct Person { age: Int; name: String }

contract TestDestructuringSuccess {
    receive() {
        // Destructuring assignment with field renaming
        let Person { age, name: personName } = Person { age: 30, name: "Alice" };
        dump(age);
        dump(personName);
    }
}
