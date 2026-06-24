// Edge case: contract with no fields, but initializing with nested struct
struct Babysitter {
    age: Int;
}

contract EmptyButInit {
    init() {
        let temp = Babysitter{ age: 5 };
    }
}