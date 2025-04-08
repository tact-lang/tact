// deep nested optional chains in persistent state
struct A1 { x: Int; }
struct A2 { a1: A1?; }
struct A3 { a2: A2?; }
struct A4 { a3: A3?; }

contract DeepOptional {
    storage: A4?;

    init() {
        self.storage = null;
    }
}