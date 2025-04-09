struct Person {
    age: Int;
}

contract TestFieldAccess {
    receive() {
         let person = Person { age: 25 };
         dump(person.age);
    }
}
