struct Compose1 { a: Int; }
struct Compose2 { a: Compose1; }
struct Compose3 { a: Compose2; }
struct Compose4 { a: Compose3; }
struct Compose5 { a: Compose4; }

contract DeepCompose {
    root: Compose5;
    init() {
        self.root = Compose5{ a: Compose4{ a: Compose3{ a: Compose2{ a: Compose1{ a: 42 }}}}};
    }
}