struct A1 { val: Int }
struct B1 { a: A1 }
struct C1 { b: B1 }

contract TestReorder {
    x: Int;
    y: String;
    data: C1;

    init() {
        self.x = 1;
        self.y = "x";
        self.data = C1{ b: B1{ a: A1{ val:42 }}};
    }
}
