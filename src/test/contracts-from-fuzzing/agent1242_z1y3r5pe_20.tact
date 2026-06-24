struct PS1 { a: Int }
struct PS2 { b: PS1 }
struct PS3 { c: PS2 }
struct PS4 { d: PS3 }
struct PS5 { e: PS4 }

contract Test {
    top: PS5;

    init() {
        self.top = PS5{ e: PS4{ d: PS3{ c: PS2{ b: PS1{ a: 7 } } } } };
    }
}
