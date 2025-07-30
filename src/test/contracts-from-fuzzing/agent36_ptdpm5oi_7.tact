struct Details {
    city: String;
    zip: Int;
}

struct Person {
    name: String;
    info: Details;
}

contract NullableDeepNested {
    citizen: Person?;    // nullable persistent struct
    
    init() {
        self.citizen = Person{
            name: "Alice",
            info: Details{ city: "Paris", zip: 75001 }
        };
    }

    receive() {
        let _ = self.citizen;
    }
}