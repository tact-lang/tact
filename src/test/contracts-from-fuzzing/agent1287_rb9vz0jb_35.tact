// Chain of nested structs containing other nested structs
struct InnerMost {
    leaf: Int;
}
struct Inner {
    node: InnerMost;
    flag: Bool;
}
struct Middle {
    branch: Inner;
    note: String;
}
struct Outer {
    top: Middle;
    id: Int;
}
contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            top: Middle{
                branch: Inner{
                    node: InnerMost{ leaf: 5 },
                    flag: true
                },
                note: "hi"
            },
            id: 42
        };
    }
}