struct Mid1 { a: Int; } 
struct Mid2 { b: Int; } 
struct Mid3 { c: Int; } 
struct Mid4 { d: Int; } 
struct Mid5 { e: Int; } 

struct Holder {
    m1: Mid1; m2: Mid2; m3: Mid3; m4: Mid4; m5: Mid5;
}

contract Grouped {
    data: Holder;
    init() {
        self.data = Holder{
            m1: Mid1{ a: 1 }, m2: Mid2{ b: 2 }, m3: Mid3{ c: 3 }, m4: Mid4{ d: 4 }, m5: Mid5{ e: 5 }
        };
    }
}