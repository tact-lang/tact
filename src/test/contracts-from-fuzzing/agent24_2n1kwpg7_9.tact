struct Person { age: Int }

contract TestFieldAccess {
    receive() {
         let p: Person = Person { age: 30 };
         let newAge: Int = p.age + 1;
    }
}
