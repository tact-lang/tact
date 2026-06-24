struct Person {
    name: String;
}

struct AddressBook {
    person: Person;
}

contract TestNestedFieldAccess {
    receive() {
         let ab = AddressBook { person: Person { name: "Alice" } };
         dump(ab.person.name);
    }
}
