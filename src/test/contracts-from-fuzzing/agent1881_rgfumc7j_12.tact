struct Nested1 {
    f: Int;
}

struct Nested2 {
    f: Nested1;
}

struct Nested3 {
    f: Nested2;
}

struct Nested4 {
    f: Nested3;
}

struct Nested5 {
    f: Nested4;
}

struct Nested6 {
    f: Nested5;
}

contract DeepNestedTest {
    f: Nested6;

    init() {
        self.f = Nested6{f: Nested5{f: Nested4{f: Nested3{f: Nested2{f: Nested1{f:123}}}}}};
    }
}