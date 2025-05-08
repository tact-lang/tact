struct Person { name: String }

contract TestStructString {
    person: Person = Person{ name: "Alice in Wonderland" };

    receive() {
        dump(self.person.name);
    }
}
