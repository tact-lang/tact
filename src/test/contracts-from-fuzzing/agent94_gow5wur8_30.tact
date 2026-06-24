// contract with many deeply nested nullable fields
struct X1 {
    v: Int?;
}
struct X2 {
    v: X1?;
}
struct X3 {
    v: X2?;
}
struct X4 {
    v: X3?;
}
struct X5 {
    v: X4?;
}

contract Test {
    x: X5;

    init() {
        self.x = X5{ v: X4{ v: X3{ v: X2{ v: X1{ v: null } } } } };
    }
}