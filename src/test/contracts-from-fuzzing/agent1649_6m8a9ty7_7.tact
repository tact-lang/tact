struct Inner {
    name: String = "default";
    age: Int?; // implicit default null
}

struct Outer {
    status: Bool = false;
    details: Inner; // no default
}

contract TestContract {
    info: Outer;

    init() {
        self.info = Outer{
            status: true,
            details: Inner{
                name: "Bob",
                age: null,
            },
        };
    }
}