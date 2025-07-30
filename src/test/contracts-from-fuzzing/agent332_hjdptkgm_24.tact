contract MultipleStructs {
    first: First;
    second: Second;

    init() {
        self.first = First{x: 7};
        self.second = Second{y: "hello"};
    }
}

struct First { x: Int; }
struct Second { y: String; }