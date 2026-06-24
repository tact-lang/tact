struct Recurse1 {
    next: Recurse2?;
}

struct Recurse2 {
    something: Int;
}

contract NestedWithNullInit {
    data: Recurse1;

    init() {
        self.data = Recurse1{
            next: null
        };
    }
}
