struct Recursive1 {
    ref: Recursive2?;
}

struct Recursive2 {
    ref: Recursive3?;
}

struct Recursive3 {
    ref: Recursive4?;
}

struct Recursive4 {
    val: Int?;
}

contract TestContract {
    x: Recursive1;

    init() {
        self.x = Recursive1{ ref: null };
    }
}