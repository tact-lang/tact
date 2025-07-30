struct BigNested {
    a: Nested1;
    b: Nested1;
    c: Nested1;
    d: Nested1;
}

struct Nested1 {
    e: Nested2;
    f: Nested2;
}

struct Nested2 {
    g: Nested3;
}

struct Nested3 {
    h: Int;
    i: Bool;
    j: String;
}

contract TestContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: Nested1{ e: Nested2{ g: Nested3{ h: 1, i:true, j:"a" } }, f: Nested2{ g: Nested3{ h: 2, i:true, j:"b" } } },
            b: Nested1{ e: Nested2{ g: Nested3{ h: 3, i:true, j:"c" } }, f: Nested2{ g: Nested3{ h: 4, i:true, j:"d" } } },
            c: Nested1{ e: Nested2{ g: Nested3{ h: 5, i:true, j:"e" } }, f: Nested2{ g: Nested3{ h: 6, i:true, j:"f" } } },
            d: Nested1{ e: Nested2{ g: Nested3{ h: 7, i:true, j:"g" } }, f: Nested2{ g: Nested3{ h: 8, i:true, j:"h" } } }
        };
    }
}