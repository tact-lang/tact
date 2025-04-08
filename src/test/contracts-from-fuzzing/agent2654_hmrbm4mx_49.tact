struct First { a: Int; }
struct Second { b: Bool; }

contract MultiStructsFields {
    x: First;
    y: Second;

    init() {
        self.x = First{a:5};
        self.y = Second{b:true};
    }
}