struct Person {
    age: Int;
}

contract TestStructToCell {
    receive() {
        let p: Person = Person { age: 30 };
        let c: Cell = p.toCell();
    }
}
