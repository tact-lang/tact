struct A {
    f: Int;
}
struct B {
    g: String;
    h: A;
}

contract NestDiffTypes {
    data: B;
    init() {
        self.data = B{g: "abc", h: A{f: 5}};
    }
}