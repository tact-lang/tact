struct A {
    flag: Bool;
    amount: Int?; 
}

struct B {
    label: String;
    nested: A?;
}

contract OptionalNested {
    data: B;

    init() {
        self.data = B{ label: "hi", nested: null };
    }
}