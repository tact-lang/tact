struct Person {
    name: String = "Alice";
    age: Int?; 
}

contract StructFieldWithDefault {
    person: Person = Person{};
}
