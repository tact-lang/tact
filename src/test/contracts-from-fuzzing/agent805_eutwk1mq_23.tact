struct GrandChild {
    value: Int?;
    flag: Bool;
}
struct Child {
    gc: GrandChild?;
    note: String;
}
struct Parent {
    child: Child?;
    id: Int;
}
contract TestContract {
    data: Parent;
    init() {
        self.data = Parent{
            child: Child{
                gc: null,
                note: "hi"
            },
            id: 7
        };
    }
}