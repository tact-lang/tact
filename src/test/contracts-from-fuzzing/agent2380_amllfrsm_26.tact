struct D {
    extra: Int?;
}
struct C {
    next: D?;
    flag: Bool;
}
struct B {
    next: C?;
}
struct A {
    next: B?;
    name: String = "root";
}

contract TestContract {
    data: A;
    init() {
        self.data = A{
            next: B{ next: null }
            // no 'name', should default to "root"
        };
    }
}