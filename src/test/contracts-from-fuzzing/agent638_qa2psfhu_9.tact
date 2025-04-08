struct S {
    x: Int = 10;
    y: Int = 20;
}

struct Top {
    s: S = S{ x: 1, y:2 };
    flag: Bool = false;
    name: String = "Bob";
}

contract DefaultsPropagation {
    data: Top = Top{ s: S{ x: 3, y: 4 }, flag: true, name: "Alice" };

    receive() {}
}