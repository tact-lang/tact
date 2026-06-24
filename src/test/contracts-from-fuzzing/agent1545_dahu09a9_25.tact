struct Nest1 {
    val: Int;
}
struct Nest2 {
    x: Nest1;
}
struct Nest3 {
    y: Nest2;
}
struct Nest4 {
    z: Nest3;
}

contract Deep4 {
    val: Nest4;
    init() {
        self.val = Nest4{ z: Nest3{ y: Nest2{ x: Nest1{ val: 42 } } } };
    }
}
