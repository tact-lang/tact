struct Tiny1 { a: Int }
struct Tiny2 { a: Bool }
struct Tiny3 { a: String }
struct Tiny4 { a: Cell }
struct Tiny5 { a: Slice }

struct Combined {
    one: Tiny1;
    two: Tiny2;
    three: Tiny3;
    four: Tiny4;
    five: Tiny5;
}

contract TestContract {
    data: Combined;

    init() {
        self.data = Combined{
            one: Tiny1{a:1},
            two: Tiny2{a:true},
            three: Tiny3{a:"x"},
            four: Tiny4{a:emptyCell()},
            five: Tiny5{a:emptyCell().asSlice()},
        };
    }
}
