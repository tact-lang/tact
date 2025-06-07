struct A { value: Int }
struct B { next: A }

contract CircularLikeStruct {
    first: B;

    init() {
        self.first = B{
            next: A{ value: 1 }
        };
    }
}