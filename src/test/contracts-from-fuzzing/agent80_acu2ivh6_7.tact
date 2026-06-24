struct Person { name: String; age: Int; }

contract TestFieldAccess {
    receive() {
         let p: Person = Person { name: "Alice", age: 30 };
         dump(p.name);
         dump(p.age);
    }
}
