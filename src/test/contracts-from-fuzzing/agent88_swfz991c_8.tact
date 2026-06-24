struct Person { name: String; age: Int?; }

contract TestNestedOptionals {
    receive() {
        let p: Person = Person{ name: "Alice", age: null };
        if (p.age != null) {
            dump(p.age!!); // should dump the age if not null
        } else {
            dump(0); // expected output: 0 because age is null
        }
    }
}
