struct Nest3 {
    val: Int?;
}

struct Nest2 {
    n3: Nest3;
}

struct Nest1 {
    n2: Nest2;
}

contract DeepHierarchy {
    data: Nest1;

    init() {
        self.data = Nest1{ n2: Nest2{ n3: Nest3{ val: 7 } } };
    }
}