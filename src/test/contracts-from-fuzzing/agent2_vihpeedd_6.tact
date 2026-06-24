struct Person { name: String; age: Int; }

contract TestRecordAccess {
    receive() {
        let person = Person { name: "Alice", age: 30 };
        let age = person.age;
        let name = person.name;
    }
}
