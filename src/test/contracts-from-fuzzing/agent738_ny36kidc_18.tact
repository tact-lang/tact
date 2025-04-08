struct A1 {
    i: Int;
}

struct A2 {
    i: Int;
}

struct A3 {
    i: Int;
}

struct A4 {
    i: Int;
}

struct A5 {
    i: Int;
}

contract BulkStructFields {
    f1: A1;
    f2: A2;
    f3: A3;
    f4: A4;
    f5: A5;
    
    init() {
        self.f1 = A1{ i: 1 };
        self.f2 = A2{ i: 2 };
        self.f3 = A3{ i: 3 };
        self.f4 = A4{ i: 4 };
        self.f5 = A5{ i: 5 };
    }
}